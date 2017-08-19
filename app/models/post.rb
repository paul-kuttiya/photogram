class Post < ActiveRecord::Base
  include Tokenable
  include Mixin::Voteable

  default_scope { order(created_at: :desc) }
  validates_presence_of :image, :caption
  belongs_to :user
  has_many :comments, -> { order(created_at: :asc) }
  has_many :mentions

  has_many :post_tags
  has_many :tags, through: :post_tags

  mount_uploader :image, PhotoUploader
  validates_integrity_of :image, message: "cannot be larger than 1MB." #carrierwave

  def has_hashtags?
    hashtags.present?
  end

  def hashtags
    caption.scan(/#\w+/).uniq.map { |tag| tag[1..-1].downcase }
  end

  def liked_by?(user)
    !!votes.find_by(user: user)
  end

  def mention_users

  end
end