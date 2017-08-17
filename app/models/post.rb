class Post < ActiveRecord::Base
  include Tokenable
  include Voteable

  default_scope { order(created_at: :desc) }
  validates_presence_of :image, :caption
  belongs_to :user
  has_many :comments, -> { order(created_at: :asc) }

  mount_uploader :image, PhotoUploader
  validates_integrity_of :image, message: "cannot be larger than 1MB." #carrierwave
end