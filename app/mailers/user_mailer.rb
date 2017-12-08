class UserMailer < ApplicationMailer
  default from: 'Two Nouns'
  layout "mailer"

  def welcome_email(current_user)
    @user = current_user
    # need to update URL once deployed
    @url  = 'http://twonouns.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
