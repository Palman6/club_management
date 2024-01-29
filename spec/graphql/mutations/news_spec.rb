# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'News Mutations' do
  let_it_be(:user1) { create(:user) }
  let_it_be(:variables) do
    {
      input: {
        title: Faker::Name.name,
        content: Faker::Lorem.paragraph
      }
    }
  end

  it 'should create news' do
    result = ClubManagementSchema.execute(query, context: { current_user: user1 }, variables:)
    expect(result['data']['createNews']['news']['title']).to eq(variables[:input][:title])
  end

  def query
    <<~GQL
      mutation createNews($input: CreateNewsInput!){
          createNews(input: $input){
            news{
              title
              content
            }
          }
        }
    GQL
  end
end
