class AddDreparedAtToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :prepared_at, :datetime
  end
end
