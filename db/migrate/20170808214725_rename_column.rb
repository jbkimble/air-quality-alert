class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :weather_points, :aqi, :us_aqi
  end
end
