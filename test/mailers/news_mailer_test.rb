# frozen_string_literal: true

require 'test_helper'

class NewsMailerTest < ActionMailer::TestCase
  test 'new_news_email' do
    mail = NewsMailer.new_news_email
    assert_equal 'New news email', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
