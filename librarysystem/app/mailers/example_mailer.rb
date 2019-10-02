class ExampleMailer < ActionMailer::Base
  default from: 'ncsu.csc.517@gmail.com'

  def test_email()
  	mail(to: yxiao28@ncsu.edu, subject: 'test if this works')
  end

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: '517 Team project system gen')
  end

end
