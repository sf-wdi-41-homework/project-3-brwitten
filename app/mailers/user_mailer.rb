class UserMailer < ApplicationMailer
  default from: 'Two Nouns'
  layout "mailer"

  def welcome_email(current_user)
    @user = current_user
    # need to update URL once deployed
    @url  = 'http://twonouns.com/login'
    mail(to: @user.email, subject: 'Welcome to Two Nouns')
  end

  def attach_magazine(current_user)
    @user = current_user
    mail(to: @user.email, subject: 'Here is Your Magazine')
  end

end
