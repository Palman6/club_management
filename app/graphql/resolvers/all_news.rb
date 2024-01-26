# frozen_string_literal: true

module Resolvers
    # description 'Fetch all News details'
    class AllNews < BaseResolver
      type [Types::NewsType], null: true
      description 'All news lists'

      def resolve
        authorize(::News.all, :index?)
      end
   
    end
  end
  