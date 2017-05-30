class Nomads::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    p "YYYEEEAAAHHH"
    p @user = User.from_omniauth(request.env["omniauth.auth"])
  end

end
