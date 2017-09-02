class YouralertsController < ApplicationController
  def index
    user_alerts = Alert.where(phone: alert_params["number"]).to_json(:include => {:air_index => {:only => :index}}, :only => :zipcode)
    respond_to do |format|
      format.json { render json: user_alerts, :status => :ok}
    end
  end

  private
    def alert_params
      params.permit(:number)
    end
end
