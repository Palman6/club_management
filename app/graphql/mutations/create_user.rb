# frozen_string_literal: true

module Mutations
    # Mutaion class
    class CreateUser < Mutations::BaseMutation
      argument :name, String, required: true
      argument :email, String, required: true
      argument :designation, String, required: true
      argument :company, String, required: true
      argument :address, String, required: true
      argument :role, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true
  
      def resolve(name:, email:, designation:, company:, address:, role:, password:,password_confirmation:)  
        user = User.new(name:, email:, designation:, company:, address:, role:, password:, password_confirmation:)
        if user.save
          { user:, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
      end
    end
  end

