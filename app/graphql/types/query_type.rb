# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :event, [Types::EventType], null: false
    field :get_event_by_id, Types::EventType, null: true do
      description 'Fetch Event details'
      argument :id, ID, 'ID of event', required: true
    end

    def event
      authorize(::Event.all, :index?)
    end

    def get_event_by_id(id:)
      authorize(::Event.find(id), :show?)
    end

    # field :event, resolver: Resolvers::Event

    # field :event, Types::EventType, null: true do
    #   description 'Fetch Event details'
    #   argument :id, ID, 'ID of event', required: true
    # end

    # def event(id:)
    #   Resolvers::Event.new.resolve(id: id)
    # end
  end
end
