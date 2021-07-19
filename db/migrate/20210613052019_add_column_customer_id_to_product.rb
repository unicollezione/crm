# frozen_string_literal: true

class AddColumnCustomerIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :customer_id, :integer
  end
end
