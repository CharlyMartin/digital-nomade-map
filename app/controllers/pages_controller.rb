class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!, only: [:home, :nomad_around]

  def home
  end

  def nomad_around
  end

end
