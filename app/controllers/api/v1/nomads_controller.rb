class Api::V1::NomadsController < Api::V1::BaseController
  def show
    @nomad = Nomad.find(params[:email])
  end

  def update
  end
end
