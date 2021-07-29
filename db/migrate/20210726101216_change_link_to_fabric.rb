class ChangeLinkToFabric < ActiveRecord::Migration[6.0]
  def change
    change_column :fabrics, :link, :text
  end
end
