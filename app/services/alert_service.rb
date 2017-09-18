class AlertService

  def self.send_alerts
    unique_zipcodes = Alert.distinct.pluck(:zipcode)
    todays_rating_by_zip = []
    unique_zipcodes.each do |zipcode|
      zipcode_air_data = AirDataService.new.get_air_quality(zipcode)
      todays_air_aqi = WeatherPoint.create(zipcode_air_data).us_aqi.to_i
      todays_rating_by_zip << [zipcode, todays_air_aqi]
    end
    todays_rating_by_zip.each do |zipcode, aqi|
      alerts_for_zipcode = Alert.where(zipcode: zipcode, active: true)
      alerts_for_zipcode.each do |alert|
        if alert.air_index.bottom_range <= aqi
          TwilioService.send_alert(alert.phone, alert.zipcode, alert.air_index.index)
        end
      end
    end
  end

end
