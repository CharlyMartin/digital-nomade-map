class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_nomad!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_params = [:first_name, :last_name, :address, :zip_code, :city, :country]

    devise_parameter_sanitizer.permit(:sign_up, keys: devise_params)
    devise_parameter_sanitizer.permit(:account_update, keys: devise_params)
  end

  # nomad#index after authentication
  def after_sign_in_path_for(resource)
    nomads_path
  end

end
