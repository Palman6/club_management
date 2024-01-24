# frozen_string_literal: true

class AddInformationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :designation, :string
    add_column :users, :company, :string
    add_column :users, :address, :string
    add_column :users, :role, :integer
  end
end
