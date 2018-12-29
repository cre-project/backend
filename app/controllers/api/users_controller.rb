module Api
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def show
      render json: @user
    end

    def create
      @user = User.new(user_params)

      if @user.save
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
        params.require(:user).permit(:first_name, :last_name, :password_digest, :email, :license_number, :phone_number, :fax, :title, :subscription_expiration, :picture_url)
      end
  end
end
