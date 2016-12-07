class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def update
    if @nomad = Nomad.find_by(email: api_params[:email])
      @nomad.update(email: api_params[:email], latitude: api_params[:latitude], longitude: api_params[:longitude])
    end
    render json: @nomad
  end

  def api_params
    params.permit(:email, :latitude, :longitude, :api)
  end
end
