# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::Name.name }
    location { Faker::Address.full_address }
    description { Faker::Lorem.sentences }
    date { Faker::Date.in_date_period(month: 1) }
  end

  factory :event_update do
    name { Faker::Name.name }
    location { Faker::Address.full_address }
    description { Faker::Lorem.sentences }
    date { Faker::Date.in_date_period(month: 1) }
  end
end
