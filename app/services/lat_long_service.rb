class LatLongService

  def self.get_lat_long(zipcode)
    uri = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=#{zipcode}&key=#{ENV["google_key"]}")
    response = Net::HTTP.get(uri)
    lat_lng = JSON.parse(response, symbolize_names: true)[:results][0][:geometry][:location]
    lat_lng
  end
end
