# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.integer :creator_id
      t.string :name
      t.string :description
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
