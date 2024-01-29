# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateEvent, type: :request do
  let_it_be(:user1) { create(:user) }
  let_it_be(:event) { create(:event, creator: user1) }


  describe 'Create Event' do
    let_it_be(:variables) do
      {
        input: {
          name: Faker::Name.name,
          description: Faker::Lorem.paragraph,
          date: Faker::Date.in_date_period(month: 1).strftime('%Y-%m-%d'),
          location: Faker::Address.full_address
        }
      }
    end

    it 'should create event' do
      result = ClubManagementSchema.execute(create_query, context: { current_user: user1 }, variables:)
      expect(result['data']['createEvent']['event']['name']).to eq(variables[:input][:name])
    end
  end

  describe 'Create Event' do
    let_it_be(:variables) do
      {
        input: {
          id: event.id,
          name: Faker::Name.name,
          description: Faker::Lorem.paragraph,
          date: Faker::Date.in_date_period(month: 1).strftime('%Y-%m-%d'),
          location: Faker::Address.full_address
        }
      }
    end
  
    it 'should update event' do
      result = ClubManagementSchema.execute(update_query, context: { current_user: user1 }, variables:)
      expect(result['data']['updateEvent']['event']['id'].to_i).to eq(event.id)
      expect(result['data']['updateEvent']['event']['name']).to eq(variables[:input][:name])
    end
  end

  def create_query
    <<~GQL
      mutation createEvent($input: CreateEventInput!){
          createEvent(input: $input){
            event{
              id
              name
            }
          }
        }
    GQL
  end

  def update_query
    <<~GQL
      mutation updateEvent($input: UpdateEventInput!){
        updateEvent(input: $input){
            event{
              id
              name
            }
          }
        }
    GQL
  end
end
