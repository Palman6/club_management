# frozen_string_literal: true

# mutation types
module Types
  # mutation types
  class MutationType < Types::BaseObject
    field :create_event, mutation: Mutations::CreateEvent
    field :update_event, mutation: Mutations::UpdateEvent
    field :delete_event, mutation: Mutations::DeleteEvent
  end
end
