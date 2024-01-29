# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Events, type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:news_a) { create(:news, creator: user) }
  let_it_be(:news_b) { create(:news, creator: user) }

  it 'fetches all the news' do
    response, errors = ClubManagementSchema.execute(query1, variables: { key: :all_news })
    expect(errors).to be_nil
    expect(response.to_h['data']['allNews'].pluck('id').map(&:to_i)).to contain_exactly(news_a.id, news_b.id)
  end

  it 'fetches a news' do
    response, errors = ClubManagementSchema.execute(query2(id: news_a.id), variables: { key: :news })
    expect(errors).to be_nil
    expect(response.to_h['data']['news']['id'].to_i).to eq(news_a.id)
  end

  def query1
    <<~GQL
      query{
        allNews{
          id title
        }
      }
    GQL
  end

  def query2(id:)
    <<~GQL
      query{
        news(id: #{id}){
          id title
        }
      }
    GQL
  end
end
