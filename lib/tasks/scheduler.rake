desc "This task is called by the Heroku scheduler add-on to send air-quality-alerts"

task :send_alerts => :environment do
  puts "Sending alerts"
  AlertService.send_alerts
  puts "Alerts Finished sending"
end
