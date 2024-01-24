# frozen_string_literal: true

module Mutations
  class DeleteEvent < BaseMutation
    description 'Deletes a event by ID'

    field :message, String, null: true

    argument :id, ID, required: true

    def resolve(id:)
      event = ::Event.find(id)
      if authorized_to_destroy?(context[:current_user])
        event.destroy
        { success: true, message: 'Deleted Successfully' }
      else
        { success: false, message: 'Not Aauthorized' }
      end
    end

    private

    def authorized_to_destroy?(current_user)
      current_user&.admin?
    end
  end
end
