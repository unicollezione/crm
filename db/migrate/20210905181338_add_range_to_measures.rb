class AddRangeToMeasures < ActiveRecord::Migration[6.0]
  def change
    add_column :measures, :range, :string
  end
end
