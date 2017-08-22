class WeatherPoint < ApplicationRecord
  validates :city, :state, :country, :zipcode, :us_aqi, :air_index_id,
            :latitude, :longitude, presence: true

  belongs_to :air_index

  def self.get_us_rating(aqi)
    if 0 <= aqi && aqi <= 50
      return 1
    elsif 51 <= aqi && aqi <= 100
      return 2
    elsif 101 <= aqi && aqi <= 150
      return 3
    elsif 151 <= aqi && aqi <= 200
      return 4
    elsif 201 <= aqi && aqi <= 300
      return 5
    elsif 301 <= aqi && aqi <= 500
      return 6
    else
      return "Invalid US AQI"
    end
  end

end
