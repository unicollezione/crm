# frozen_string_literal: true

class CreateWorkrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :workrooms do |t|
      t.string :name
      t.string :chat
      t.string :status
      t.string :link

      t.timestamps
    end
  end
end
