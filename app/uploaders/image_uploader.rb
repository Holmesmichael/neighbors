# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  
  #  include CarrierWave::MiniMagick

  
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [ "help.png"].compact.join('_'))
  end

 
  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # version :medium do
  #   process :resize_to_fill => [300, 300]
  # end
 

  
  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
