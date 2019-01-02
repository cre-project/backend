class PasswordResetMailer < ApplicationMailer
  default from: 'info@offeringcre.com'

  def reset_password_email
    @user = params[:user]
    @url  = '<dashboard-url>/reset/' + @user.reset_password_token
    mail(to: 'marion.schleifer@gmail.com', subject: 'Password Reset Offering CRE')
  end
end
