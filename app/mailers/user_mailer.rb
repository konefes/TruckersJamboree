class UserMailer < ApplicationMailer
  default from: 'team15seltt@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Truckers Jamboree!')
  end
  
  def vendor_email(current)
    @current = current
    @url  = 'http://example.com/login'
    mail(to: @current.email, subject: 'Vendor Registration Receipt!')
  end
end
