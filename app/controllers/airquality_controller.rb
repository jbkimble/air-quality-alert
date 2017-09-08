class AirqualityController < ApplicationController
  def index
    @weatherpoint = WeatherPoint.last
  end

  def create
    local_air_data = AirDataService.new.get_air_quality(params["zipcode"])
    wp = WeatherPoint.new(local_air_data)

    wp.save
    result_hash = wp.as_json
    result_hash[:rating] = wp.air_index.index
    respond_to do |format|
      format.json { render json: result_hash.to_json, :status => :ok}
    end
  end

end
