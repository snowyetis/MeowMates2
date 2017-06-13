class CoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include ::CarrierWave::Backgrounder::Delay

  # Choose what kind of storage to use for this uploader:
  storage :file if Rails.env.development?
  storage :fog if Rails.env.production?

  def content_type_whitelist
    /image\//
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process convert: 'png'

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

  version :resized_cover do
    process resize_to_fit: [1000,500]
  end

end
