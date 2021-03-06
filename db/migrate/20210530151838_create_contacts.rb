# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :contact_type, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
