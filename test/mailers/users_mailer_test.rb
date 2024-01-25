# frozen_string_literal: true

require 'test_helper'

class UsersMailerTest < ActionMailer::TestCase
  test 'registration_email' do
    mail = UsersMailer.registration_email
    assert_equal 'Registration email', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
