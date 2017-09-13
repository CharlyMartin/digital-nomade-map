class Api::V1::NomadsController < Api::V1::BaseController
  def show
    # binding.pry
    @nomad = Nomad.find(params[:id])
  end

  def update
  end
end
