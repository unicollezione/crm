class CreateProductFabricContents < ActiveRecord::Migration[6.0]
  def change
    create_table :product_fabric_contents do |t|
      t.references :product, null: false, foreign_key: true
      t.references :fabric_content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
