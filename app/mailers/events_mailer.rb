# frozen_string_literal: true

# EventsMailer mailer
class EventsMailer < ApplicationMailer
  def event_update_email(user, event)
    @user = user
    @event = event

    mail(
      to: @user.email,
      subject: "Event updates on #{@event.name}"
    )
  end
end
