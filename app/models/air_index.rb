class AirIndex < ApplicationRecord
  validates :index, presence: true, uniqueness: true

  has_many :weather_points
  has_many :alerts
end
