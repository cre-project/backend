class PasswordResetMailer < ApplicationMailer
  default from: 'info@offeringcre.com'

  def reset_password_email
    @user = params[:user]
    @dashboard = ENV["DASHBOARD_URL"]
    @url  = @dashboard + '/password-reset/' + @user.reset_password_token
    mail(to: @user.email, subject: 'Password Reset Offering CRE')
  end
end
