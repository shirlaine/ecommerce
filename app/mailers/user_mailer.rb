class UserMailer < ApplicationMailer

  def purchase_successful(user)
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Thank You for Your Purchase')
  end

end
