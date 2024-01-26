# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    title { 'Test user' }
    content { Faker::Lorem.paragraphs }
  end
end
