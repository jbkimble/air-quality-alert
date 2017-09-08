class AlertController < ApplicationController
  def index
  end

  def create
    alert = Alert.new(alert_params)
    alert.save
    TwilioService.send_intro_message(alert.phone, alert.zipcode, alert.air_index.index)
    respond_to do |format|
      format.json { render json: alert.to_json, :status => :ok}
    end
  end

  def show
    @alert = Alert.find(params[:id])
  end

  def destroy
    alert = Alert.find(alert_params["id"])
    alert.active = false
    alert.save
    user_alerts = Alert.where(phone: alert.phone, active: true)
    if user_alerts.empty?
      flash[:success] = 'Successfully canceled all alerts!'
      redirect_to root_path
    else
      redirect_to alert_index_path(phone: alert.phone)
    end
  end

  private
    def alert_params
      params[:air_index_id] = AirIndex.find_by(index: params[:alert_level]).id if params[:alert_level]
      params.permit(:phone, :air_index_id, :zipcode, :active, :id)
    end
end
