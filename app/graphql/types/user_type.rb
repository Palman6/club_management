# frozen_string_literal: true

module Types
  # Usertypes class
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :reset_password_token, String
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime
    field :remember_created_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :designation, String
    field :company, String
    field :address, String
    field :role, Integer
    field :name, String
    field :gender, Integer
  end
end
