class AnimalAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include ::CarrierWave::Backgrounder::Delay

  # Choose what kind of storage to use for this uploader:
  storage :file if Rails.env.development?
  storage :fog if Rails.env.production?

  def content_type_whitelist
    /image\//
  end

  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # def cache_dir
  #   "#{Rails.root}/tmp/uploads"
  # end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process convert: 'png'

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

  version :gallery_thumb do
    process resize_to_fill: [150,300]
  end

  version :thumb do
    process resize_to_fill: [50,50]
  end

end
