# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test user' }
    email { 'test@test.com' }
    company { 'Selise test' }
    role { 'admin' }
    address { 'Thimphu bhutan' }
    designation { 'BE Developer' }
    password { 'test12' }
    password_confirmation { 'test12' }
  end
end
