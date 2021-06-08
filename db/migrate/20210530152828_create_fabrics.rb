# frozen_string_literal: true

class CreateFabrics < ActiveRecord::Migration[6.0]
  def change
    create_table :fabrics do |t|
      t.string :title

      t.timestamps
    end
  end
end
