class AirqualityController < ApplicationController
  def index
    @weatherpoint = WeatherPoint.last
  end

  def create
    local_air_data = AirDataService.new.get_air_quality(params["zipcode"])
    local_air_data[:air_index_id] = WeatherPoint.get_us_rating(local_air_data[:us_aqi].to_i)
    wp = WeatherPoint.new(local_air_data)
    if wp.save
      result_hash = wp.as_json
      result_hash[:rating] = wp.air_index.index
      respond_to do |format|
        format.json { render json: result_hash.to_json, :status => :ok}
      end
    else
    end
  end

end
