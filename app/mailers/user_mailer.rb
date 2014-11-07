class UserMailer < ActionMailer::Base
  default from: "timezoney-c9-gtee2311.c9.io"
  
  def welcome_email(user)
      @user = user
      @url = sign_in_url
      
      mail( to: user.email, subject: 'Thanks for registering')
  end
end
