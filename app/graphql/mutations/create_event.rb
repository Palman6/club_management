# frozen_string_literal: true

module Mutations
  # create event mutation class
  class CreateEvent < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :location, String, required: true
    argument :date, GraphQL::Types::ISO8601DateTime, required: true

    field :event, Types::EventType, null: true
    field :errors, [String], null: false

    def resolve(name:, description:, location:, date:)
      creator = context[:current_user]

      event = Event.new(name:, description:, location:, date:, creator_id: creator.id)
      Pundit.authorize(creator, event, :create?)
      if event.save
        { event:, errors: [] }
      else
        { event: nil, errors: event.errors.full_messages }
      end
    end
  end
end
