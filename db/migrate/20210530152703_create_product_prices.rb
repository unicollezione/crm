class CreateProductPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :product_prices do |t|
      t.integer :value
      t.string :tag
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
