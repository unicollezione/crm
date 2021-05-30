class CreateCustomerMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_measures do |t|
      t.references :measure, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
