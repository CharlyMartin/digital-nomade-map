class Api::V1::NomadsController < Api::V1::BaseController
  require "time"

  def index
    @nomads = Nomad.all
  end

  def show
    @nomad = Nomad.find_by(username: params[:id])
  end

  def update
    if @nomad = Nomad.find_by(username: params[:id])
      @nomad.update(
        latitude: api_params[:latitude],
        longitude: api_params[:longitude],
        last_chrome_update_date: Time.zone.now
      )
      render json: @nomad
    end
  end

  private

  def nomad_params
    params.require(:nomad).permit(:latitude, :longitude, :last_chrome_update_date)
  end
end


# protect_from_forgery with: :null_session


