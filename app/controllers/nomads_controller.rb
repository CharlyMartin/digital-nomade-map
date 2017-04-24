class NomadsController < ApplicationController
  before_action :set_nomad, only: [:edit_info, :edit_location, :update]

  def index
    @nomads = Nomad.all.order(created_at: :desc).where.not(latitude: nil, longitude: nil)
    @nomad_count = Nomad.count
    @center_point = {lat: current_nomad.latitude, lng: current_nomad.longitude}.to_json

    @nomads_location = Gmaps4rails.build_markers(@nomads) do |nomad, marker|
      marker.lat nomad.latitude
      marker.lng nomad.longitude
      marker.picture({
                :url => "https://unsplash.it/200/300/?random",
                :width   => 32,
                :height  => 32
               })
      marker.infowindow render_to_string(partial: "/nomads/map_box", locals: { nomad: nomad })
    end



  end

  def edit_info
  end

  def edit_location
  end

  def update
    if @nomad.update(nomad_params)
      redirect_to nomads_path, notice: "Successfully updaded"
    else
      # 2 possibilities for rendering, location || info. To Be Done
      render :edit_location
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

  def custom_markers(user, marker)
    # https://github.com/apneadiving/Google-Maps-for-Rails/wiki/Markers

    if user == current_nomad
      marker.picture({
        :url    =>  "../assets/images/logo.png",
        :width  =>  100,
        :height =>  100
      })
    else
      marker.picture({
        url:     'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/RedDot.svg/2000px-RedDot.svg.png',
        width:   50,
        height:  50
      })
    end
  end

end
