class NomadsController < ApplicationController
  def index
    @nomads = Nomad.all.order(created_at: :desc)
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
