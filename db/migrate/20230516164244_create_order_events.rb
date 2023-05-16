class CreateOrderEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :order_events do |t|
      t.references :order, null: false, foreign_key: true
      t.string :event_source
      t.jsonb :body

      t.timestamps
    end
    add_index :order_events, :event_source
  end
end
