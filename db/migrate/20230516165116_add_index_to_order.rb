# frozen_string_literal: true

class AddIndexToOrder < ActiveRecord::Migration[7.0] # :nodoc:
  def change
    add_index :orders, :trello_card_id
  end
end
