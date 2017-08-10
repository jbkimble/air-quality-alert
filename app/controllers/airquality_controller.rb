class AirqualityController < ApplicationController
  def index
    @weatherpoint = WeatherPoint.last
  end

  def create
    local_air_data = AirDataService.new.get_air_quality(params["zipcode"])
    local_air_data[:rating] = WeatherPoint.get_us_rating(local_air_data[:us_aqi].to_i)
    wp = WeatherPoint.new(local_air_data)
    if wp.save
      respond_to do |format|
        format.json { render json: wp.to_json, :status => :ok}
      end
    else
      # descriptive flash message
    end
  end

end
