class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!, only: [:home, :nomads_around, :mission, :privacy]

  def home
    random_nomads = Nomad.order("RANDOM()").limit(15)
    @typed_js = name_in_city_list(random_nomads)
  end

  def nomads_around
    coords_array = Geocoder.coordinates(location_params[:location])
    session[:lat] = coords_array[0]
    session[:lng] = coords_array[1]
    @nomads_around = Nomad.near(coords_array, 100)[0..-1]
  end

  def about
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
