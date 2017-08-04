class AirqualityController < ApplicationController
  def index
  end

  def create
    x = params["zipcode"]
    
    redirect_to airquality_index_path
  end

  # 1. Person enters valid zipcode into text field
  # 2. They press 'Get Air Quality'
  # 3. post is sent to AirqualityController
  # 4. AirqualityController create method sends zipcode to ZipcodeAPI and gets
  #   return lat long coordinates.
  # 5. Send return lat long coordinates to AirVisualAPI and gets return of
  #   JSON
  # 6. Parse Json and get Air Quality Index and city name.
  # 7. Create entry in the database of datapoint(city, state, country, airquality,
  #                                             AQI rating, created_at, updated_atd)
  # 8. Redirect to airquality_show_path and show the object that was just created.
  #
  # End. They see the air quality for the nearest station to the zipcode they
  #      entered displayed on the page.


end
