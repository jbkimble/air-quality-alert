class AlertService

  def self.send_alerts
    unique_zipcodes = Alert.distinct.pluck(:zipcode)
    todays_rating_by_zip = []
    unique_zipcodes.each do |zipcode|
      zipcode_air_data = AirDataService.new.get_air_quality(zipcode)
      WeatherPoint.create(zipcode_air_data)
      todays_rating_by_zip << [zipcode, todays_air_rating]
    end
    todays_rating_by_zip.each do |zipcode, rating|
      alerts_for_zipcode = Alert.where(zipcode: zipcode, active: true)
      alerts_for_zipcode.each do |alert|
        if alert.air_index_id <= rating
          TwilioService.send_alert(alert.phone, alert.zipcode, alert.air_index.index)
        end
      end
    end
  end

end
