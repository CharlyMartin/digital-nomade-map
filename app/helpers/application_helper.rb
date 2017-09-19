module ApplicationHelper

  def absolute_path(asset)
    URI.join(root_url, asset_path(asset))
  end

end
