class AlertService

  def self.send_alerts
    # gets unique zipcodes from alert table
    unique_zipcodes = Alert.distinct.pluck(:zipcode)
    todays_rating_by_zip = []
    # makes API call for each zipcode using AirDataService.new.get_air_quality(zipcode)
    unique_zipcodes.each do |zipcode|
      zipcode_air_data = AirDataService.new.get_air_quality(zipcode)
      todays_air_rating = WeatherPoint.get_us_rating(local_air_data[:us_aqi].to_i)
      zipcode_air_data[:air_index_id] = todays_air_rating
      # This returns hash of data for zipcode which is saved in WeatherPoints table
      WeatherPoint.create(zipcode_air_data)
      # it also builds a nested array with the [[unique zipcode, todays AQI rating]]
      todays_rating_by_zip << [zipcode, todays_air_rating]
    end

    # then goes through Alerts table and gets all records for a zipcode, goes through each record
      # and if the todays AQI rating is at or above the threshold for that user it sends them a text
    todays_rating_by_zip.each do |zipcode, rating|
      alerts_for_zipcode = Alert.where(zipcode: zipcode)
      alerts_for_zipcode.each do |alert|
        if alert.air_index_id >= rating do
          TwilioService.send_alert(alert.phone, alert.zipcode, alert.air_index.index)
          # send this phone number a descriptive text message
        end
      end

    end
  end
end
