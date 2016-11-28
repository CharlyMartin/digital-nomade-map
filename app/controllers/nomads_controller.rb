class NomadsController < ApplicationController
  def index
    @nomads = Nomad.all.order(created_at: :desc).where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@nomads) do |nomad, marker|
      marker.lat nomad.latitude
      marker.lng nomad.longitude
      marker.infowindow render_to_string(partial: "/nomads/map_box", locals: { nomad: nomad })
    end
  end

  def new
    @nomad = Nomad.new
  end

  def create
    @nomad = Nomad.new(nomad_params)
    if @nomad.save
      redirect_to root_path, notice: 'You are now on the nomad map :)'
    else
      render :new
    end
  end

  def edit
    @nomad = Nomad.find(params[:id])
  end

  def update
    @nomad = Nomad.find(params[:id])
    if @nomad.update(nomad_params)
      redirect_to root_path, notice: 'Your nomad profile has been update :)'
    else
      render :edit
    end
  end

  def destroy
    @nomad = Nomad.find(params[:id])
    @nomad.destroy
  end

  private

  def nomad_params
    params.require(:nomad).permit(:first_name, :last_name, :phone, :facebook, :email,
                                  :address, :zip_code, :city, :country)
  end
end
