class AddFileToFabric < ActiveRecord::Migration[6.0]
  def change
    add_column :fabrics, :photo, :oid
  end
end
