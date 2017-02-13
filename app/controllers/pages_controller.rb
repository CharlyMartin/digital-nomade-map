class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!, only: [:home, :nomads_around]

  def home
    @nomads = Nomad.all
    @typed_js = name_in_city_list(@nomads)
  end

  def nomads_around
    location_params[:location]
    @nomads_around = Nomad.near(location_params[:location], 100).all[0..-1]
  end

  def mission
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end

  def name_in_city_list(object)
    list = []

    object.each do |item|
      list << "There's #{item.first_name} in #{item.city}"
    end
    return list.shuffle[0..19]
  end

end
