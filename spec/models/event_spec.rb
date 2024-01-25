# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  describe 'Association' do
    it { is_expected.to have_many(:attendings).dependent(:destroy) }
    it { is_expected.to have_many(:attendees).dependent(:destroy) }
    it { is_expected.to belong_to(:creator) }
    it { is_expected.to have_one_attached(:image) }
  end
end
