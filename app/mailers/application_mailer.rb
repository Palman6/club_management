# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@club.com'
  layout 'mailer'
end
