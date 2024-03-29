# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay

  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog
  # storage :grid_fs

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    # Use this location when storage :file
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    
    # Storage when using GridFS
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end
  # All images have a 3x2 ratio (of width to height)

  version :large do
    process :auto_orient
    process :resize_to_limit => [750, 500]
  end

  version :gallery, :from_version => :large do
    process :auto_orient
    process :resize_to_limit => [543, 362]
  end
  
  version :slide, :from_version => :gallery do
    process :auto_orient
    process :resize_to_limit => [378, 252]
  end
  
  version :list, :from_version => :slide do
    process :auto_orient
    process :resize_to_limit => [300, 200]
  end

  version :thumb, :from_version => :list do
    process :auto_orient
    process :resize_to_fill => [98, 65, 'Center']
    # process :get_version_dimensions
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  
  def auto_orient 
    manipulate! do |image| 
      image.auto_orient 
      image 
    end 
  end
  
  # def get_version_dimensions
  #   width, height = 'identify -format "%wx%h" #{file.path}'.split(/x/) 
  # end
end
