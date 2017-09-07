# The [Air-Quality-Alert.net](https://air-quality-alert.herokuapp.com "Air-Quality-Alert.net Homepage") Story
Air-Quality-Alert is a website where visitors can go to check the Air Quality of different locations around the world.  Visitors can also sign up to receive text or email alerts when the Air Quality in their area reaches the Good, Moderate, Unhealthy For Sensitive Groups, Unhealthy, Very Unhealthy, or Hazardous designations set by the EPA.

[Link to Air-Quality-Alert.net HD Demo Video on YouTube](https://www.youtube.com/watch?v=Zn7YMt9Xea0 "Air-Quality-Alert.net HD Demo Video")

![Air-Quality-Alert.net Demo Gif](https://github.com/jbkimble/photo_repo/blob/master/air-quality-alert_demo.gif "Air-Quality-Alert.net Demo Gif")

This project was inspired by the recent forest fires in the British Columbia region of Canada which caused smokey and smoggy conditions throughout the Pacific NW.  These conditions persisted for more than a week impacting both healthy individuals and sensitive groups.  It took several days of smokey and hazy conditions before the true cause, and appropriate response for these conditions, was disseminated throughout the population.  

During this time many people engaged in activities which put them at risk because a lack of awareness.  In the future Air-Quality-Alert will allow individuals, particularly sensitive populations, to be alerted as soon as conditions in their area are harmful so they can take appropriate measures to protect the health of themselves and their loved ones.

# Built With
Ruby on Rails, Twilio for SMS, Vanilla JS, and T.D.D. with RSpec/Capybara

# Process
I used an agile, test-driven, approach to development while developing this application.  This process sped up development, allowed me to confirm functions of the application performed as expected, and allowed me to develop from a users perspective.

Below are the mockups I made in Sketch before beginning development, I think I delivered a close match to what I initially envisioned.

<img src="https://raw.githubusercontent.com/jbkimble/photo_repo/master/air-quality-alert/AQA_homepage.png" height="300" />

<img src="https://raw.githubusercontent.com/jbkimble/photo_repo/master/air-quality-alert/AQA_results_page.png" height="300" />

# What I learned

coming soon!

# How To Run
##### Download application from github

`$ git clone https://github.com/jbkimble/air-quality-alert.git`

`$ cd air-quality-alert`

`$ bundle install`

##### create, migrate, and seed the database

`$ rake db:create`

`$ rake db:migrate`

`$ rake db:seed`

##### Run Tests

`$ rspec`

##### Start server

`$ rails s`

##### application will now be available at localhost:3000 or your default port

