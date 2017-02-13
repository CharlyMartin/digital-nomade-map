class NomadsController < ApplicationController

  def index
    @nomads = Nomad.all.order(created_at: :desc).where.not(latitude: nil, longitude: nil)

    @nomad_count = Nomad.count

    @nomads_location = Gmaps4rails.build_markers(@nomads) do |nomad, marker|
      marker.lat nomad.latitude
      marker.lng nomad.longitude
      markers_picture(nomad, marker)
      marker.infowindow render_to_string(partial: "/nomads/map_box", locals: { nomad: nomad })
    end

    @center_point = {lat: current_nomad.latitude, lng: current_nomad.longitude}

  end

  private

  def nomad_params
    params.require(:nomad).permit(:first_name, :last_name, :phone, :facebook, :email,
                                  :address, :zip_code, :city, :country)
  end

  def markers_picture(user, marker)
    # https://github.com/apneadiving/Google-Maps-for-Rails/wiki/Markers

    if user == current_nomad
      marker.picture({
        url:     'https://unsplash.it/400/400/?random',
        width:   30,
        height:  30
      })
    else
      marker.picture({
        url:     'https://unsplash.it/400/400/?random',
        width:   50,
        height:  50
      })
    end
  end

end
