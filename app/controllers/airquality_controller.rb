class AirqualityController < ApplicationController
  def index
    @weatherpoint = WeatherPoint.last
  end

  def show
  end

  def create
    uri = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=#{params["zipcode"]}&key=#{ENV["google_key"]}")
    response = Net::HTTP.get(uri)
    lat_lng = JSON.parse(response, symbolize_names: true)[:results][0][:geometry][:location]
    lattitude = lat_lng[:lat]
    longitude = lat_lng[:lng]

    uri = URI.parse("http://api.airvisual.com//v2/nearest_city?key=#{ENV["av_key"]}&lat=#{lattitude}&lon=#{longitude}")
    response = Net::HTTP.get(uri)
    air_quality_data = JSON.parse(response, symbolize_names: true)
    us_aqi = air_quality_data[:data][:current][:pollution][:aqius]
    city_name = air_quality_data[:data][:city]
    state_name = air_quality_data[:data][:state]
    country_name = air_quality_data[:data][:country]
    wp = WeatherPoint.new(city: city_name, state: state_name, country: country_name,
                    zipcode: params["zipcode"], aqi: us_aqi, rating:WeatherPoint.get_rating(us_aqi))

    if wp.save
      redirect_to airquality_path(wp.id)
    else
      redirect_to root_path
    end

  end

end
