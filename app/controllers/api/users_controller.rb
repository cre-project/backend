module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:create]

    def show
      render json: @user
    end

    def create
      pabbly_customer_id = params[:data][:customer_id]
      subscription_expiration = params[:data][:expiry_date]
      subscription = params[:data][:plan][:plan_code]

      auth = { username: ENV["PABBLY_API_KEY"], password: ENV["PABBLY_SECRET_KEY"] }
      pabbly_user = HTTParty.get('https://payments.pabbly.com/api/v1/customer/' + pabbly_customer_id, basic_auth: auth)

      company_name = pabbly_user["data"]["company_name"]
      first_name = pabbly_user["data"]["first_name"]
      last_name = pabbly_user["data"]["last_name"]
      email = pabbly_user["data"]["email_id"]
      @user = User.create(email: email, first_name: first_name, last_name: last_name, pabbly_customer_id: pabbly_customer_id, subscription_expiration: subscription_expiration, subscription: subscription)

      if @user.present?
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
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

    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password_digest, :email, :license_number, :phone_number, :fax, :title, :subscription_expiration, :picture_url, :pabbly_customer_id, :subscription)
    end
  end
end
