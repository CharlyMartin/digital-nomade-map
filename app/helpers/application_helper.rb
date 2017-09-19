module ApplicationHelper

  def absolute_path(asset)
    URI.join(root_url, asset_path('avatar'))
  end

end
