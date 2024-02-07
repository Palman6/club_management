# frozen_string_literal: true

# Mailer for nofify user after remove
class AttendeeMailer < ApplicationMailer
  def attendee_remove_email(user_id, event_id)
    @user = User.find(user_id)
    @event = Event.find(event_id)

    mail(
      to: @user.email,
      subject: 'Revoke user from event'
    )
  end
end
