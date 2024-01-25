# frozen_string_literal: true

# types
module Types
  # mutation types
  class BaseUnion < GraphQL::Schema::Union
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
  end
end
