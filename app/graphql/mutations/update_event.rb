# frozen_string_literal: true

module Mutations
  class UpdateEvent < BaseMutation
    argument :name, String, required: false
    argument :description, String, required: false
    argument :date, GraphQL::Types::ISO8601DateTime, required: false
    argument :location, String, required: false
    argument :id, ID, required: true

    field :event, Types::EventType, null: false
    field :errors, [String], null: false

    def resolve(id:, name:, description:, location:, date:)
      creator = context[:current_user]
      event = ::Event.find(id)
      Pundit.authorize(creator, event, :update?)
      if event.update(name:, description:, location:, date:, creator_id: creator.id)
        { event:, errors: [] }
      else
        { event: nil, errors: event.errors.full_messages }
      end
    end
  end
end
