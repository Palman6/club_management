# frozen_string_literal: true

require 'test_helper'

class EventsMailerTest < ActionMailer::TestCase
  test 'event_update_email' do
    mail = EventsMailer.event_update_email
    assert_equal 'Event update email', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
