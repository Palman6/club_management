# frozen_string_literal: true

# UsersMailer mailer
class UsersMailer < ApplicationMailer
  def registration_email(user)
    @user = user

    mail(
      to: @user.email,
      subject: 'User Registration'
    )
  end
end
