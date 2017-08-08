class AddColumnsToWeatherpoint < ActiveRecord::Migration[5.0]
  def change
    add_column :weather_points, :china_aqi, :integer
    add_column :weather_points, :latitude, :string
    add_column :weather_points, :longitude, :string
  end
end
