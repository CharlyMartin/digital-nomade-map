class NomadsController < ApplicationController
  before_action :set_nomad, only: [:show, :edit, :update]
  #skip_before_action :authenticate_nomad!

  def index
    nomads = Nomad.all.where.not(id: current_nomad.id)
    @count = nomads.count
    @nomads = nomads.to_json
    @current = current_nomad.to_json
  end

  def show
  end

  def edit
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
    params.require(:nomad).permit(
      :first_name, :last_name, :username, :latitude, :longitude, :phone, :facebook,
      :email, :gender, :occupation, :address, :zip_code, :city, :country
    )
  end
end
