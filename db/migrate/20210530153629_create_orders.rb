# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :idx
      t.references :customer, null: false, foreign_key: true
      t.datetime :purchased_at
      t.references :product, null: false, foreign_key: true
      t.references :fabric, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
