# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.integer :idx
      t.string :nickname

      t.timestamps
    end
  end
end
