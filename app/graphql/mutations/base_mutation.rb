# frozen_string_literal: true

module Mutations
  # Mutaion class
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    include Pundit::Authorization

    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject
  end
end
