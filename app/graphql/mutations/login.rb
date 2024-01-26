# frozen_string_literal: true

module Mutations
  # User login 
  class Login < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
        user = User.find_by(email: email)
        if context[:controller].warden.authenticate(scope: :user)
          user
        else
          raise GraphQL::ExecutionError.new("Invalid email or password")
        end
    end

  end
end
