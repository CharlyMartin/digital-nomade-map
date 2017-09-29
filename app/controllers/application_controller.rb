class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_nomad!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def configure_permitted_parameters
    devise_params = [
      :first_name, :last_name, :username, :gender, :occupation, :latitude,
      :longitude
    ]

    devise_parameter_sanitizer.permit(:sign_up, keys: devise_params)
    devise_parameter_sanitizer.permit(:account_update, keys: devise_params)
  end

  def set_locale
    I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || nomads_path
  end
end
