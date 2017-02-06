class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!, only: [:home, :nomads_around]

  def home
    @nomads = Nomad.all
    @typed_js = name_in_city_list
  end

  def nomads_around
    location_params[:location]
    @nomads_around = Nomad.near(location_params[:location], 100).all[0..-1]
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end

  def name_in_city_list
    list = []

    Nomad.all.each do |nomad|
      list << "There's #{nomad.first_name} in #{nomad.city}"
    end
    return list
  end

end
