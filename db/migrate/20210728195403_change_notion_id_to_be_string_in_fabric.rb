class ChangeNotionIdToBeStringInFabric < ActiveRecord::Migration[6.0]
  def change
    change_column :fabrics, :notion_id, :string
  end
end
