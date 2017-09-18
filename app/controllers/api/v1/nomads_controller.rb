class Api::V1::NomadsController < Api::V1::BaseController
  def index
    @nomads = Nomad.all
  end

  def show
    @nomad = Nomad.find_by_username(params[:id])
  end

  def update
  end
end


# protect_from_forgery with: :null_session
# require "time"

# def update
#   if @nomad = Nomad.find_by(email: api_params[:email])
#     @nomad.update(email: api_params[:email], latitude: api_params[:latitude], longitude: api_params[:longitude], last_chrome_update_date: Time.zone.now)
#   end
#   render json: @nomad
# end

# private

# def api_params
#   params.permit(:email, :latitude, :longitude, :api, :last_chrome_update_date)
# end
