class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!, only: [:home, :nomad_around]

  def home
  end

  def nomad_around
    location_params[:location]
    raise
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end
end
