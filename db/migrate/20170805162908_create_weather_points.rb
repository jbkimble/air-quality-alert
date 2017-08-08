class CreateWeatherPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_points do |t|
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.string :aqi
      t.string :rating

      t.timestamps null: false
    end
  end
end
