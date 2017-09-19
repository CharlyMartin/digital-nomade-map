module NomadsHelper

  def avatar_url
    # current_nomad.facebook_picture_url || asset_path 'avatar.png'
    asset_path 'avatar.png'
  end

end
