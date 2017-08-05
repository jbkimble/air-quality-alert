class AirqualityController < ApplicationController
  def index
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
    WeatherPoint.new(city: city_name, state: state_name, country: country_name,
                    zipcode: params["zipcode"], aqi: us_aqi, rating:"good")
    #add 'get_rating method which takes aqi and return us government text rating'
    #build weatherpoint object
    #redirect to that objects show page and display information
    redirect_to airquality_path
  end

  # 1. Person enters valid zipcode into text field
  # 2. They press 'Get Air Quality'
  # 3. post is sent to AirqualityController
  # 4. AirqualityController create method sends zipcode to ZipcodeAPI and gets
  #   return lat long coordinates.
  # 5. Send return lat long coordinates to AirVisualAPI and gets return of
  #   JSON
  # 6. Parse Json and get Air Quality Index and city name.
  # 7. Create entry in the database of datapoint(city, state, country, airquality,
  #                                             AQI rating, created_at, updated_atd)
  # 8. Redirect to airquality_show_path and show the object that was just created.
  #
  # End. They see the air quality for the nearest station to the zipcode they
  #      entered displayed on the page.


end
