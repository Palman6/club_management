# frozen_string_literal: true

# types
module Types
  # mutation types
  module NodeType
    include Types::BaseInterface
    # Add the `id` field
    include GraphQL::Types::Relay::NodeBehaviors
  end
end
