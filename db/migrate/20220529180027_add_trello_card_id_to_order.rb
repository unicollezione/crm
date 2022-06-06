class AddTrelloCardIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :trello_card_id, :string
  end
end
