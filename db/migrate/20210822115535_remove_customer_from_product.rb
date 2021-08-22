class RemoveCustomerFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :customer_id
  end
end
