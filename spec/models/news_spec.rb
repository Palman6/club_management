# frozen_string_literal: true

require 'rails_helper'

RSpec.describe News do
  describe 'Association' do
    it { is_expected.to belong_to(:creator) }
    it { is_expected.to have_one_attached(:image) }
  end
end
