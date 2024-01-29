# frozen_string_literal: true

module Resolvers
  # description 'Fetch Event details'
  class Event < BaseResolver
    description 'Fetch Event details'

    type Types::EventType, null: true
    argument :id, ID, 'ID of event', required: true

    def resolve(id:)
      event = ::Event.find(id)
      authorize(event, :show?)
    end
  end
end
