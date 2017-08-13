class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :resized do
    process resize_to_fit: [300, 10000]
  end

  # Choose what kind of storage to use for this uploader:
  storage :file

  #store dir
  def store_dir
    "images/#{model.user.username}/posts/#{model.id}"
  end
end
