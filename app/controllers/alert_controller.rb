class AlertController < ApplicationController
  def index
  end

  def create
    alert = Alert.new(alert_params)
    if alert.save
      TwilioService.send_intro_message(alert.phone, alert.zipcode, alert.air_index.index)
      respond_to do |format|
        format.json { render json: alert.to_json, :status => :ok}
      end
    else
    end
  end

  def show
    @alert = Alert.find(params[:id])
  end

  def destroy
    alert = Alert.find(alert_params["id"])
    user_alerts = Alert.where(phone: alert.phone, active: true)
    alert.active = false
    alert.save
    if user_alerts.empty?
      flash[:success] = 'Successfully canceled all alerts!'
      redirect_to root_path
    else
      redirect_to alert_index_path(phone: alert.phone)
    end
  end

  private
    def alert_params
      params[:air_index_id] = return_index_id(params[:alert_level])
      params.permit(:phone, :air_index_id, :zipcode, :active, :id)
    end

    def return_index_id(alert_level)
      case alert_level
      when "Good"
        return 1
      when "Moderate"
        return 2
      when "Unhealthy For Sensitive Groups"
        return 3
      when "Unhealthy"
        return 4
      when "Very Unhealthy"
        return 5
      when "Hazardous"
        return 6
      end
    end
end
