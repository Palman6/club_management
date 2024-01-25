# frozen_string_literal: true

module Types
  module InputTypes
    # UpdateEventInput
    class UpdateEventInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
      argument :date, GraphQL::Types::ISO8601DateTime, required: false
      argument :location, String, required: false
      argument :date, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end