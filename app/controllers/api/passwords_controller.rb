require 'rest-client'

module Api
  class PasswordsController < ApplicationController
    skip_before_action :authenticate_request

    def request_reset
      if params[:email].blank?
        logger.error "Email not present"
        render body: nil, status: :ok
      end

      user = User.find_by(email: params[:email].downcase)

      if user.present?
        user.generate_password_token!
        ::PasswordResetMailer.with(user: user).reset_password_email.deliver_now
        render json: {status: 'ok'}, status: :ok
      else
        logger.error "Email address not found."
        render body: nil, status: :ok
      end
    end

    def reset
      token = params[:token].to_s

      if params[:token].blank?
        return render json: {error: 'Token not present'}
      end

      user = User.find_by(reset_password_token: token)

      if user.present? && user.password_token_valid?
        if user.reset_password!(params[:password])
          render json: {status: 'ok'}, status: :ok
        else
          logger.error "Error. Could not reset password."
          render body: nil, status: :ok
        end
      else
        logger.error "Link not valid or expired. Try generating a new link."
        render body: nil, status: :ok
      end
    end
  end
end
