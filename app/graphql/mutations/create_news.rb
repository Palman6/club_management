# frozen_string_literal: true

module Mutations
  # CreateNews class provides create news mutation
  class CreateNews < Mutations::BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true
    # argument :image, ApolloUploadServer::Upload, required: true

    field :news, Types::NewsType, null: true
    field :errors, [String], null: false

    def resolve(title:, content:)
      # image = ActiveStorage::Blob.create_and_upload!(
      #     io: file,
      #     filename: file.original_filename,
      #     content_type: file.content_type
      # )
      creator = context[:current_user]

      news = News.new(title:, content:, creator_id: creator.id)
      Pundit.authorize(creator, news, :create?)
      if news.save
        { news:, errors: [] }
      else
        { news: nil, errors: news.errors.full_messages }
      end
    end
  end
end
