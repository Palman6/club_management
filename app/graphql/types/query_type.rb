# frozen_string_literal: true

# types
module Types
  # mutation types
  class QueryType < Types::BaseObject

    field :events, resolver: Resolvers::Events
    field :event, resolver: Resolvers::Event
    field :news, resolver: Resolvers::News
    field :all_news, resolver: Resolvers::AllNews
    field :users, resolver: Resolvers::Users 
  end
end
