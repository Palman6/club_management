# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/events_mailer
class EventsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/events_mailer/event_update_email
  def event_update_email
    EventsMailer.event_update_email
  end
end
