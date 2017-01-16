class PagesController < ApplicationController
  skip_before_action :authenticate_nomad!
  def home

  end
end
