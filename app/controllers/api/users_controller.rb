module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:create]

    def show
      render json: @user
    end

    def create
      data_params = get_data_params
      if params[:data].present? && data_params[:customer_id].present? && data_params[:expiry_date].present? && data_params.dig(:plan, :plan_code).present?
        pabbly_customer_id = params[:data][:customer_id]
        subscription_expiration = params[:data][:expiry_date]
        subscription = params[:data][:plan][:plan_code]

        auth = { username: ENV["PABBLY_API_KEY"], password: ENV["PABBLY_SECRET_KEY"] }
        pabbly_user = HTTParty.get('https://payments.pabbly.com/api/v1/customer/' + pabbly_customer_id, basic_auth: auth)
        if pabbly_user["status"] == "success"
          company_name = pabbly_user["data"]["company_name"]
          first_name = pabbly_user["data"]["first_name"]
          last_name = pabbly_user["data"]["last_name"]
          email = pabbly_user["data"]["email_id"]

          @user = User.create(email: email, first_name: first_name, last_name: last_name, pabbly_customer_id: pabbly_customer_id, subscription_expiration: subscription_expiration, subscription: subscription)
          @user.company = Company.create(name: company_name)
        else
          logger.error "Customer cannot be created because the params are falsly structured: #{params.inspect}"
        end
      else
        logger.error "Customer cannot be created: #{params.inspect} (#{params.class.name})"
        logger.error "Conditions are: #{params[:data].present?} && #{data_params[:customer_id].present?} && #{data_params[:expiry_date].present?} && #{data_params.dig(:plan, :plan_code).present?}"
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

    def pabbly_redirect
      pabbly_customer_id = params[:customer_id]
      auth = { username: ENV["PABBLY_API_KEY"], password: ENV["PABBLY_SECRET_KEY"] }
      pabbly_response = HTTParty.post('https://payments.pabbly.com/api/v1/portal_sessions/', basic_auth: auth, body: { customer_id: pabbly_customer_id })
      if pabbly_response
        customer_portal_url = pabbly_response["data"]["access_url"]
        render json: { customer_portal_url: customer_portal_url }, status: :ok
      else
        render json: { message: "Could not log in."}, status: unprocessable_entity
      end
    end

    private
    def get_data_params
      params.require(:data).permit!
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password_digest, :email, :license_number, :phone_number, :fax, :title, :subscription_expiration, :picture_url, :pabbly_customer_id, :subscription, company_attributes: [ :name, :website_url, :logo_url, :address_id ])
    end
  end
end
