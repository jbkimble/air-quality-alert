class WeatherPoint < ApplicationRecord
  validates :city, :state, :country, :zipcode, :us_aqi, :rating,
            :latitude, :longitude, presence: true

  def self.get_us_rating(aqi)
    if 0 <= aqi && aqi <= 50
      return "Good"
    elsif 51 <= aqi && aqi <= 100
      return "Moderate"
    elsif 101 <= aqi && aqi <= 150
      return "Unhealthy for Sensitive Groups"
    elsif 151 <= aqi && aqi <= 200
      return "Unhealthy"
    elsif 201 <= aqi && aqi <= 300
      return "Very Unhealthy"
    elsif 301 <= aqi && aqi <= 500
      return "Hazardous"
    else
      return "Invalid US AQI"
    end
  end

end
