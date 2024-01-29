# frozen_string_literal: true

module Mutations
  # User login
  class Login < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:)
      user = User.find_by(email:)
      unless context[:controller].warden.authenticate(scope: :user)
        raise GraphQL::ExecutionError, 'Invalid email or password'
      end

      user
    end
  end
end
