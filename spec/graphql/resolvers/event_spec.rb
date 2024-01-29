# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Events, type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:event_a) { create(:event, creator: user) }
  let_it_be(:event_b) { create(:event, creator: user) }

  it 'fetches all the events' do
    response, errors = ClubManagementSchema.execute(query1, variables: { key: :events })
    expect(errors).to be_nil
    expect(response.to_h['data']['events'].pluck('id').map(&:to_i)).to contain_exactly(event_a.id, event_b.id)
  end

  it 'fetches a event' do
    response, errors = ClubManagementSchema.execute(query2(id: event_a.id), variables: { key: :event })
    expect(errors).to be_nil
    expect(response.to_h['data']['event']['id'].to_i).to eq(event_a.id)
  end

  def query1
    <<~GQL
      query{
        events{
          id name
        }
      }
    GQL
  end

  def query2(id:)
    <<~GQL
      query{
        event(id: #{id}){
          id name
        }
      }
    GQL
  end
end
