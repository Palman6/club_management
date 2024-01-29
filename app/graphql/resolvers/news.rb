# frozen_string_literal: true

module Resolvers
  # description 'Fetch News details'
  class News < BaseResolver
    description 'Fetch news details'

    type Types::NewsType, null: true
    argument :id, ID, 'ID of news', required: true

    def resolve(id:)
      authorize(::News.find(id), :show?)
    end
  end
end
