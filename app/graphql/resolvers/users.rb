# frozen_string_literal: true

module Resolvers
    # description 'Fetch all Event details'
    class Users < BaseResolver
      type [Types::UserType], null: true
      description 'All user lists'

      def resolve
        authorize(::User.all, :index?)
      end
   
    end
  end
  