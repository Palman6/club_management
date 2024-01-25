# frozen_string_literal: true

# types
module Types
  # mutation types
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument
  end
end
