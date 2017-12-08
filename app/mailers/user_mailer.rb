class UserMailer < ApplicationMailer
  default from: 'twonounsemail@gmail.com'
  layout "mailer"

  def welcome_email(current_user)
    @user = current_user
    @url  = 'http://twonouns.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
