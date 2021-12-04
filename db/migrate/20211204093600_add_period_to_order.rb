class AddPeriodToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :ready_at, :date
  end
end
