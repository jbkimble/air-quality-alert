class AddIndexIdToWeatherPoint < ActiveRecord::Migration[5.0]
  def change
    add_column :weather_points, :air_index_id, :integer
  end
end
