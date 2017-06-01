class NomadsController < ApplicationController
  before_action :set_nomad, only: [:show, :edit_info, :edit_location, :update]
  #skip_before_action :authenticate_nomad!

  def index
    @nomads = Nomad.all.order(created_at: :desc).where.not(latitude: nil, longitude: nil)
  end

  def show
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

  # def creating_json(object)
  #   json_array = []

  #   object.each do |item|
  #     json_array << {
  #       id: item.id,
  #       first_name: item.first_name,
  #       last_name: item.last_name,
  #       email: item.email,
  #       lat: item.latitude,
  #       lng: item.longitude
  #     }.to_json
  #   end

  #   return json_array
  # end

end
