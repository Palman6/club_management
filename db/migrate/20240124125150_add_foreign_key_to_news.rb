# frozen_string_literal: true

class AddForeignKeyToNews < ActiveRecord::Migration[7.1]
  def up
    add_reference :news, :creator
  end
end
