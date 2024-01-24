# frozen_string_literal: true

class CreateAttendings < ActiveRecord::Migration[7.1]
  def change
    create_table :attendings do |t|
      t.integer :attending_id
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
