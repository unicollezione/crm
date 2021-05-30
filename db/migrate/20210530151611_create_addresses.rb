class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :street
      t.string :tag

      t.timestamps
    end
  end
end
