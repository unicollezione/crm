class AddTrelloToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :trello_url, :string
  end
end
