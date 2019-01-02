class PasswordResetMailer < ApplicationMailer
  default from: 'password_reset@cre.com'


  def reset_password_email
    @user = params[:user]
    @url  = '<dashboard-url>/reset/' + @user.reset_password_token
    mail(to: 'marion.schleifer@gmail.com', subject: 'Link to Reset Your Password')
  end
end
