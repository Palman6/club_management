# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsMailer do
  let_it_be(:user1) { create(:user) }

  let_it_be(:news) { create(:news, creator_id: user1.id) }

  it 'sends an email to all the users' do
    expect { described_class.new_news_email(user1, news).deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
