# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Event Mutations' do

    let_it_be(:user1) { create(:user) }
    let_it_be(:variables) do
        {
            input:{
                name: Faker::Name.name,
                description: Faker::Lorem.paragraph,
                date: Faker::Date.in_date_period(month: 1).strftime("%Y-%m-%d"),
                location: Faker::Address.full_address
            }
        }
    end

    it 'should create event' do
        result = ClubManagementSchema.execute(query, context: {current_user: user1}, variables: )
        expect(result["data"]["createEvent"]["event"]["name"]).to eq(variables[:input][:name])
    end

    def query
        <<~GQL 
        mutation createEvent($input: CreateEventInput!){
            createEvent(input: $input){
              event{
                name
              }
            }
          }
        GQL
    end
end