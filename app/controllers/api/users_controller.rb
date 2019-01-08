module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:create]

    def show
      render json: @user
    end

    def create
      # logger.error "#{params["data"]}"
      data_params = params["data"].present? ? get_data_params : {}
      if params["data"].present? && data_params["id"].present? && data_params["company_name"].present? && data_params["first_name"].present? && data_params["last_name"].present? && data_params["email_id"].present?
        email = data_params["email_id"]
        first_name = data_params["first_name"]
        last_name = data_params["last_name"]
        pabbly_customer_id = data_params["id"]
        company_name = data_params["company_name"]

        @user = User.create(email: email, first_name: first_name, last_name: last_name, pabbly_customer_id: pabbly_customer_id)
        @user.company = Company.create(name: company_name)

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
      params.require("data").permit("email_id", "first_name", "last_name", "id", "company_name")
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password_digest, :email, :license_number, :phone_number, :fax, :title, :subscription_expiration, :picture_url, :pabbly_customer_id, :subscription, company_attributes: [ :name, :website_url, :logo_url, :address_id ])
    end
  end
end
