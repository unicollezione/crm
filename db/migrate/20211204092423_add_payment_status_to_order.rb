class AddPaymentStatusToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :prepayment, :integer, default: 0
    add_column :orders, :payment, :integer, default: 0
  end
end
