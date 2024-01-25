# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/users_mailer
class UsersMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/users_mailer/registration_email
  def registration_email
    UsersMailer.registration_email
  end
end
