class AlertController < ApplicationController
  def create
    alert = Alert.new(alert_params)
    if alert.save
      TwilioService.send_intro_message(alert.phone, alert.zipcode, alert.alert_level)
      respond_to do |format|
        format.json { render json: alert.to_json, :status => :ok}
      end
    else
    end
  end

  def show
    @alert = Alert.find(params[:id])
  end

  private
    def alert_params
      params.permit(:phone, :alert_level, :zipcode, :active)
    end
end
