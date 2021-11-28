class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.references :product, null: false, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
