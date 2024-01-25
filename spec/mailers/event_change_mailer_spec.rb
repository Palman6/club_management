# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsMailer do
  let_it_be(:user1) { create(:user) }

  let_it_be(:event1) { create(:event, creator_id: user1.id) }

  it 'sends an email to all the users' do
    expect { described_class.event_update_email(user1, event1).deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
