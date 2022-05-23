class CreateTrelloCards < ActiveRecord::Migration[6.0]
  def change
    create_table :trello_cards do |t|
      t.references :order, null: false, foreign_key: true
      t.string :trello_card

      t.timestamps
    end
  end
end
