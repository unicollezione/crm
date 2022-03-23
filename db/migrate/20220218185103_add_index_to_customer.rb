class AddIndexToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_index :customers, :nickname
  end
end
