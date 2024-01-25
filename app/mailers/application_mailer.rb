# frozen_string_literal: true

# Application mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@club.com'
  layout 'mailer'
end
