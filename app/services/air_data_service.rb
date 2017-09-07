class AirDataService

  def get_air_quality(zipcode)
    lat_lng = LatLongService.get_lat_long(zipcode)
    air_quality_data = use_primary_api(lat_lng)
    if air_quality_data[:message] == "no_nearest_city"
      airnow_air_quality_data = use_backup_api(lat_lng[:lat], lat_lng[:lng])
      return get_useful_data_from_airnow(airnow_air_quality_data, zipcode)
    else
      return get_useful_data(air_quality_data, zipcode)
    end
  end

  def use_primary_api(lat_lng)
    uri = URI.parse("http://api.airvisual.com//v2/nearest_city?key=#{ENV["av_key"]}&lat=#{lat_lng[:lat]}&lon=#{lat_lng[:lng]}")
    response = Net::HTTP.get(uri)
    JSON.parse(response, symbolize_names: true)[:data]
  end

  def use_backup_api(latitude, longitude)
    uri = URI.parse("http://www.airnowapi.org/aq/observation/latLong/current/?format=application/json&latitude=#{latitude}&longitude=#{longitude}&distance=200&API_KEY=#{ENV["airnow_key"]}")
    response = Net::HTTP.get(uri)
    JSON.parse(response, symbolize_names: true)[0]
  end

  def get_useful_data_from_airnow(air_quality_data, zipcode)
    {
      latitude: air_quality_data[:Latitude].to_s,
      longitude: air_quality_data[:Longitude].to_s,
      us_aqi: air_quality_data[:AQI].to_s,
      city: air_quality_data[:ReportingArea][/[^-]+/],
      state: air_quality_data[:StateCode],
      country: "USA",
      zipcode: zipcode,
      air_index_id: WeatherPoint.get_us_rating(air_quality_data[:AQI])
    }
  end

  def get_useful_data(air_quality_data, zipcode)
    {
      latitude: air_quality_data[:location][:coordinates][1].to_s,
      longitude: air_quality_data[:location][:coordinates][0].to_s,
      us_aqi: air_quality_data[:current][:pollution][:aqius],
      china_aqi: air_quality_data[:current][:pollution][:aqicn],
      city: air_quality_data[:city],
      state: air_quality_data[:state],
      country: air_quality_data[:country],
      zipcode: zipcode,
      air_index_id: WeatherPoint.get_us_rating(air_quality_data[:current][:pollution][:aqius])
    }
  end

end
