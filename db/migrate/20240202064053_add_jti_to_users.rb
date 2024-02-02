# frozen_string_literal: true

class AddJtiToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :jti, :string, null: false
    add_index :users, :jti, unique: true
    User.where(jti: nil).each do |user|
      user.update(jti: generate_unique_value)
    end
  end
end
