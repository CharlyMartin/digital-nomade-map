module MetaTagsHelper
  def meta_name
    DEFAULT_META["meta_name"]
  end

  def meta_title
    DEFAULT_META["meta_title"]
  end

  def meta_description
    DEFAULT_META["meta_description"]
  end

  def meta_image
    absolute_path("meta_image")
  end

  def meta_fb_id
    DEFAULT_META["facebook_app_id"]
  end
end
