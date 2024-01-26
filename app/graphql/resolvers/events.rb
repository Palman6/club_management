# frozen_string_literal: true

module Resolvers
    # description 'Fetch all Event details'
    class Events < BaseResolver
      type [Types::EventType], null: true
      description 'All event lists'

      def resolve
        authorize(::Event.all, :index?)
      end
   
    end
  end