class AirDataService

  def get_air_quality(zipcode)
    lat_lng = LatLongService.get_lat_long(zipcode)
    uri = URI.parse("http://api.airvisual.com//v2/nearest_city?key=#{ENV["av_key"]}&lat=#{lat_lng[:lat]}&lon=#{lat_lng[:lng]}")
    response = Net::HTTP.get(uri)
    air_quality_data = JSON.parse(response, symbolize_names: true)[:data]
    data_for_zipcode = get_useful_data(air_quality_data)
    data_for_zipcode[:zipcode] = zipcode
    data_for_zipcode
  end

  def get_useful_data(air_quality_data)
    {
      lattitude: air_quality_data[:location][:coordinates][0].to_s,
      longitude: air_quality_data[:location][:coordinates][1].to_s,
      us_aqi: air_quality_data[:current][:pollution][:aqius],
      china_aqi: air_quality_data[:current][:pollution][:aqicn],
      city: air_quality_data[:city],
      state: air_quality_data[:state],
      country: air_quality_data[:country]
    }
  end

end
