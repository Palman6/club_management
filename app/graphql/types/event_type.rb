# frozen_string_literal: true

# Event attributes types
module Types
  # mutation types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :event_id, Integer
    field :creator_id, Integer
    field :name, String
    field :description, String
    field :location, String
    field :date, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
