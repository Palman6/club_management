# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'Association' do
    it { is_expected.to have_many(:events).dependent(:destroy) }
    it { is_expected.to have_many(:attendings).dependent(:destroy) }
    it { is_expected.to have_many(:attended_events).dependent(:destroy) }
  end
end
