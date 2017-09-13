class Api::V1::NomadsController < Api::V1::BaseController
  def index
    @nomads = Nomad.all
  end

  def show
    @nomad = Nomad.find_by_username(params[:id])
  end

  def update
  end
end
