class Nomads::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_nomad!

  def facebook
    nomad = Nomad.find_for_facebook_oauth(request.env['omniauth.auth'])

    if nomad.persisted?
      sign_in_and_redirect nomad, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_nomad_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
