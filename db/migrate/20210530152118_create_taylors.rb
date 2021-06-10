# frozen_string_literal: true

class CreateTaylors < ActiveRecord::Migration[6.0]
  def change
    create_table :taylors do |t|
      t.string :name
      t.string :meta

      t.timestamps
    end
  end
end
