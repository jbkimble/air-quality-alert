class TwilioService

  def self.send_intro_message(client_phone, zipcode, alert_level)
    client = Twilio::REST::Client.new(ENV["twilio_sid"], ENV["twilio_token"])
    client.messages.create(
      from: ENV["twilio_phone_number"],
      to: "+1#{client_phone}",
      body: "Thanks for signing up for Air-Quality-Alert.net, we'll send you a text when the air quality in #{zipcode} becomes #{alert_level}"
    )
  end

  def self.send_alert(client_phone, zipcode, alert_level)
    client = Twilio::REST::Client.new(ENV["twilio_sid"], ENV["twilio_token"])
    client.messages.create(
      from: ENV["twilio_phone_number"],
      to: "+1#{client_phone}",
      body: "ALERT:  The Air Quality in #{zipcode} is rated as #{alert_level}, which is at or below the level you wanted to be notified at.
            Hopefully the air quality improves, but we'll send you another alert tomorrow if it is still #{alert_level} or worse."
    )
  end

end
