class CreateOrderMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :order_measures do |t|
      t.references :order, null: false, foreign_key: true
      t.references :measure, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
