# frozen_string_literal: true

module Resolvers
  # description 'Fetch Event details'
  class Event < BaseResolver
    # description 'Fetch Event details'

    # argument :id, ID, 'ID of event', required: true
    # type Types::EventType, null: false

    def event
      authorize(::Event.all, :index?)
    end
  end
end
