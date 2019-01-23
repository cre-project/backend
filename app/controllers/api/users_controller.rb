module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:create, :activate, :subscription_changed]

    def show
      render json: @user
    end

    def create
      data_params = params["data"].present? ? get_data_params : {}
      if params["data"].present? && data_params["id"].present? && data_params["first_name"].present? && data_params["last_name"].present? && data_params["email_id"].present?
        email = data_params["email_id"]
        first_name = data_params["first_name"]
        last_name = data_params["last_name"]
        pabbly_customer_id = data_params["id"]

        @user = User.create(email: email, first_name: first_name, last_name: last_name, pabbly_customer_id: pabbly_customer_id)

        # company name is not always present => optionally create a company for the user
        if data_params["company_name"].present?
          @user.company = Company.create(name: data_params["company_name"])
        end
      else
        logger.error "Customer cannot be created: #{params.inspect} (#{params.class.name})"
      end
      if @user.present? && @user.save
        render json: @user, status: :ok
      else
        user_errors = @user&.errors&.full_messages&.join(', ')
        logger.error "Customer cannot be created: #{user_errors}"
        render body: nil, status: :ok
      end
    end

    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      render status: 501, json: {
        message: "Not implemented"
      }.to_json
    end

    def activate
      token = params[:token].to_s
      errmsg = "Activation token not valid or missing"

      if params[:token].blank?
        return render json: {error: errmsg}
      end

      if params[:password].blank?
        return render json: {error: "Password is required"}, status: :unprocessable_entity
      end

      # only activate inactive users (ie those with an empty password)
      user = User.find_by(pabbly_customer_id: token, password_digest: nil)

      if user.present?
        if user.reset_password!(params[:password])
          render json: {status: 'ok'}, status: :ok
        else
          logger.error "Could not activate user account: password could not be set"
          render body: nil, status: :internal_server_error
        end
      else
        render json: {error: errmsg}, status: :unprocessable_entity
      end
    end

    def pabbly_redirect
      logger.error "Params: #{params.inspect}"
      if params[:customer_id].present?
        pabbly_customer_id = params[:customer_id]
        auth = { username: ENV["PABBLY_API_KEY"], password: ENV["PABBLY_SECRET_KEY"] }
        pabbly_response = HTTParty.post('https://payments.pabbly.com/api/v1/portal_sessions/', basic_auth: auth, body: { customer_id: pabbly_customer_id })
        logger.error "Incoming Params: #{pabbly_response}"
        logger.error "Incoming Params: #{pabbly_response["params"]}"
        if pabbly_response["status"] == "success"
          customer_portal_url = pabbly_response["data"]["access_url"]
          render json: { customer_portal_url: customer_portal_url }, status: :ok
        else
          logger.error "Could not log in."
          render body: nil, status: :ok
        end
      else
        logger.error "customer_id not present"
        render body: nil, status: :bad_request
      end
    end

    def subscription_changed
      logger.error "Params: #{params.inspect}"
      data_plan_params = params["data"].present? ? get_data_plan_params : {}

      if params["data"].present? && data_plan_params["expiry_date"].present? && data_plan_params["plan"]["product_id"].present? && data_plan_params["customer_id"]
        subscription_expiration = data_plan_params["expiry_date"]
        subscription = data_plan_params["plan"]["product_id"]
        pabbly_customer_id = data_plan_params["customer_id"]

        @user = User.where(pabbly_customer_id: pabbly_customer_id)
        @user.update(subscription_expiration: subscription_expiration, subscription: subscription)

        render json: @user, status: :ok
      else
        logger.error "Customer cannot be updated: #{params.inspect} (#{params.class.name})"
        render body: nil, status: :ok
      end
    end

    private

    def get_data_plan_params
      params.require("data").permit("expiry_date", "customer_id", "plan":["product_id"])
    end

    def get_data_params
      params.require("data").permit("email_id", "first_name", "last_name", "id", "company_name")
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password_digest, :email, :license_number, :phone_number, :fax, :title, :subscription_expiration, :picture_url, :pabbly_customer_id, :subscription, company_attributes: [ :name, :website_url, :logo_url ])
    end
  end
end
