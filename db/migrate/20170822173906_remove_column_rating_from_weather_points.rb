class RemoveColumnRatingFromWeatherPoints < ActiveRecord::Migration[5.0]
  def change
    remove_column :weather_points, :rating
  end
end
