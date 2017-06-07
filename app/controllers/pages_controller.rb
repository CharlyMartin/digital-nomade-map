class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!, only: [:home, :nomads_around, :mission, :privacy]

  def home
    random_nomads = Nomad.order("RANDOM()").limit(15)
    @typed_js = name_in_city_list(random_nomads)
  end

  def nomads_around
    coords_array = Geocoder.coordinates(location_params[:location])
    coords_hash = {latitude: coords_array[0], longitude: coords_array[1]}
    session[:coords] = coords_hash
    @nomads_around = Nomad.near(coords_array, 100)[0..-1]
  end

  def mission
  end

  def privacy
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end

  def name_in_city_list(nomads)
    nomads.map do |nomad|
      "<span class='name'>#{nomad.first_name}</span> in <span class='city'>#{nomad.city}</span>"
    end
  end

end
