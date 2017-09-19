class Api::V1::NomadsController < Api::V1::BaseController
  require "time"
  acts_as_token_authentication_handler_for Nomad, only: [ :update ]

  def index
    @nomads = Nomad.all
  end

  def show
    @nomad = Nomad.find_by(username: params[:id])
  end

  def update
    @nomad = Nomad.find_by(username: params[:id])
    if @nomad.update(latitude: api_params[:latitude], longitude: api_params[:longitude], last_chrome_update_date: Time.zone.now)
      render :show
    else
      render_error
    end
  end

  private

  def nomad_params
    params.require(:nomad).permit(:latitude, :longitude, :last_chrome_update_date)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end


# protect_from_forgery with: :null_session


