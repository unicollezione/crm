class AddMaterialToFabrics < ActiveRecord::Migration[6.0]
  def change
    add_column :fabrics, :material, :string
  end
end
