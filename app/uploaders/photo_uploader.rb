class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  after :store, :delete_old_tmp_file

  # version :resized do
  #   process resize_to_fit: [300, 10000]
  # end

  ## Choose what kind of storage to use for this uploader:
  # storage :file || :aws => setup in initiaizer

  ## store dir
  def store_dir
    # if Rails.env.production?
    #   return "user_#{model.user_id}/posts/#{model.class.id}"
    # else
      return "post_images"
    # end
  end

  def cache!(new_file)
    super
    @old_tmp_file = new_file
  end

  ##delete tmp
  def delete_old_tmp_file(dummy)
    @old_tmp_file.try :delete
  end

  ##for validation
  def size_range
    0..1.megabytes
  end
end
