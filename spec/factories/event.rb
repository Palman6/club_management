# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::Name.name }
    location { Faker::Address.full_address }
    description { Faker::Lorem.paragraphs }
    date { Faker::Date.between(from: Date.today, to: Date.today + 1.month) }
  end

  factory :event_update do
    name { Faker::Name.name }
    location { Faker::Address.full_address }
    description { Faker::Lorem.paragraphs }
    date { Faker::Date.between(from: Date.today, to: Date.today + 1.month)}
  end
end
