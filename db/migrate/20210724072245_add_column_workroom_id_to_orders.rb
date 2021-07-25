class AddColumnWorkroomIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :workroom, null: false, foreign_key: true
  end
end
