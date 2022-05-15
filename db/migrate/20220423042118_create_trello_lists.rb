class CreateTrelloLists < ActiveRecord::Migration[6.0]
  def change
    create_table :trello_lists do |t|
      t.string :list
      t.string :board
      t.references :workroom, null: false, foreign_key: true
     t.timestamps
   end
 end
end
