# frozen_string_literal: true

include(Rails.application.routes.url_helpers)

module Types
  # The NewsType class provides the news attribute types
  class NewsType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :content, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :creator_id, Integer
    field :image_url, String, null: false

    def image_url
      rails_blob_path(object.image, only_path: true) if object.image.blank?
    end
  end
end
