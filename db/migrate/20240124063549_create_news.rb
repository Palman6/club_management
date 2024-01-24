# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[7.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
