# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class AvatarUploader < CarrierWave::Uploader::Base
  # include CarrierWave::Compatibility::Paperclip
  # Include RMagick or MiniMagick support:
  include CarrierWave::MiniMagick
  # include CarrierWave::RMagick

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

  process resize_to_fill: [50, 50]
  process convert: 'png'

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # process resize_to_fit: [800, 800]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [20, 20]
  end

  version :gallery_thumb do
    process resize_to_fill: [150,150]
  end

  version :resized_cover do
    process resize_to_fit: [1000,1000]
  end

  #
  # version :small_thumb, from_version: :thumb do
  #   process resize_to_fill: [20, 20]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
