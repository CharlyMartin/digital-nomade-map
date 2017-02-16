class NomadsController < ApplicationController
  before_action :set_nomad, only: [:edit_info, :edit_location, :update]

  def index
    @nomads = Nomad.all.order(created_at: :desc).where.not(latitude: nil, longitude: nil)

    @nomad_count = Nomad.count

    @nomads_location = Gmaps4rails.build_markers(@nomads) do |nomad, marker|
      marker.lat nomad.latitude
      marker.lng nomad.longitude
      gmaps4rails_marker_picture
      # markers_picture(nomad, marker)
      marker.infowindow render_to_string(partial: "/nomads/map_box", locals: { nomad: nomad })
    end

    @center_point = {lat: current_nomad.latitude, lng: current_nomad.longitude}

  end

  def edit_info
  end

  def edit_location
  end

  def update
    if @nomad.update(nomad_params)
      redirect_to nomads_path, notice: "Successfully updaded"
    else
      render :edit
    end
  end

  private

  def set_nomad
    @nomad = Nomad.find(params[:id])
  end

  def nomad_params
    params.require(:nomad).permit(:first_name, :last_name, :phone, :facebook, :email,
                                  :address, :zip_code, :city, :country)
  end

  def markers_picture(user, marker)
    # https://github.com/apneadiving/Google-Maps-for-Rails/wiki/Markers

    if user == current_nomad
      marker.picture({
        url:     "avatar.png",
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

  def gmaps4rails_marker_picture
   {
    "picture" => "avatar.png",          # string,  mandatory
     "width" =>  30,          # integer, mandatory
     "height" => 30          # integer, mandatory
     # "marker_anchor" => ,   # array,   facultative, [0, 0] is the upper left corner
     #                        #                       and [width, height] is the bottom right
     # "shadow_picture" => ,  # string,  facultative
     # "shadow_width" => ,    # string,  facultative
     # "shadow_height" => ,   # string,  facultative
     # "shadow_anchor" => ,   # string,  facultative
     # "rich_marker" =>   ,   # html, facultative
                            # If used, all other attributes skipped except "marker_anchor". This array is used as follows:
                            # [ anchor , flat ] : flat is a boolean, anchor is an int.
                            # See doc here: http://google-maps-utility-library-v3.googlecode.com/svn/trunk/richmarker/docs/reference.html
   }
  end

end
