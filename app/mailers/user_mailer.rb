class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def reset_password_email(user)
    @user = user
    @url  = "http://127.0.0.1:3000/password_resets/#{user.reset_password_token}/edit"
   # @url  = "http://coursex.heroku.com/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email,
         :subject => "Password Reset Request")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @greeting = "Hi"
    mail :to => "to@example.org"

  @url  = "http://127.0.0.1:3000/users/#{user.activation_token}/activate"
  mail(:to => user.email,
       :subject => "Welcome to CourseX")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
     @user = user
  @url  = "http://127.0.0.1:3000/login"
  mail(:to => user.email,
       :subject => "Your account is now activated")
  end
end
