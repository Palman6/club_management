# frozen_string_literal: true

module Resolvers
  # BaseResolver
  class BaseResolver < GraphQL::Schema::Resolver
    include Pundit::Authorization

    def current_user
      context[:current_user]
    end
  end
end
