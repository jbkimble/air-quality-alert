class WeatherPoint < ApplicationRecord
  validates :city, :state, :country, :zipcode, :airquality, :rating, presence: true
end
