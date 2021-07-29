class AddNotionIdToFabric < ActiveRecord::Migration[6.0]
  def change
    add_column :fabrics, :notion_id, :integer
  end
end
