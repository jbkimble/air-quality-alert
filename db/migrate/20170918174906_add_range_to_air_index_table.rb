class AddRangeToAirIndexTable < ActiveRecord::Migration[5.0]
  def change
    add_column :air_indices, :bottom_range, :integer
    add_column :air_indices, :top_range, :integer
  end
end
