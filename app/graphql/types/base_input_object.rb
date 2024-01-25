# frozen_string_literal: true

# types
module Types
  # mutation types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument
  end
end
