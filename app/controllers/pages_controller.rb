class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!, only: [:home]

  def home
  end

end
