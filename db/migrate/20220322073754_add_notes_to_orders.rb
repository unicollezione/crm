class AddNotesToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :notes, :text
  end
end
