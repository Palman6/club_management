# frozen_string_literal: true

# types
module Types
  # mutation types
  class BaseObject < GraphQL::Schema::Object
    include Pundit::Authorization

    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def current_user
      context[:current_user]
    end
  end
end
