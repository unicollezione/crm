class AddColumnsToFabric < ActiveRecord::Migration[6.0]
  def change
    add_column :fabrics, :tag, :string
    add_column :fabrics, :description, :text
    add_column :fabrics, :link, :string
    add_column :fabrics, :editor, :string
  end
end
