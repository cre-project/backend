module Api
  class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    user = User.find_by(email: params[:email])

    if command.success?
      render json: { auth_token: command.result, user: user.as_json(except: [:password_digest, :reset_password_token, :reset_password_sent_at]) }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
  end
end
