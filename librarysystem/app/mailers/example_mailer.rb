class ExampleMailer < ActionMailer::Base
  def send_email(user)
    @user = user
    mail(to: @user.email, subject: 'Email from 517 Project')
  end
end
