# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    title { 'Test user' }
    content { 'Test news' }
  end
end
