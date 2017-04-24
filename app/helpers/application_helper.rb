module ApplicationHelper

  def image_url(image)
    URI.join(root_url, image_path(image))
  end

end
