class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!, only: [:home, :nomads_around, :mission]

  def home
    @nomads = Nomad.all
    @typed_js = name_in_city_list(@nomads.shuffle[0..14])
  end

  def nomads_around
    @nomads_around = Nomad.near(location_params[:location], 100).all[0..-1]
    session[:location] = location_params[:location]
  end

  def mission
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end

  def name_in_city_list(object)
    object.map do |nomad|
      "<span class='name'>#{nomad.first_name}</span> in <span class='city'>#{nomad.city}</span>"
    end
  end

end
