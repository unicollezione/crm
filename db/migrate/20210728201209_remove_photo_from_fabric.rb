class RemovePhotoFromFabric < ActiveRecord::Migration[6.0]
  def change
    remove_column :fabrics, :photo, :oid
  end
end
