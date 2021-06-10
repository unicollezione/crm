# frozen_string_literal: true

class CreateMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :measures do |t|
      t.string :tag

      t.timestamps
    end
  end
end
