module NomadsHelper

  def set_icon(nomad)
    if current_nomad.id == nomad.id
      image_url('current-nomad-icon')
    else
      image_url('nomad-icon')
    end
  end

  def set_content(nomad)
    if current_nomad.id == nomad.id
      render('../views/nomads/shared/iw-current-nomad-content', nomad: nomad)
    else
      render('../views/nomads/shared/iw-nomad-content', nomad: nomad)
    end
  end

  def avatar_url
    current_nomad.facebook_picture_url #|| asset_path 'avatar.png'
  end

end
