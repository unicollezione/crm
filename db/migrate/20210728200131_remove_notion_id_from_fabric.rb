class RemoveNotionIdFromFabric < ActiveRecord::Migration[6.0]
  def change
    remove_column :fabrics, :notion_id, :string
  end
end
