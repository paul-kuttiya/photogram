class User < ActiveRecord::Base
  include Mixin::Voteable
  include Mixin::Noticeable 

  mount_uploader :avatar, AvatarUploader
  validates_integrity_of :avatar

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email, case_sensitive: false
  validates :username, length: { in: 5..20 }, format: { with: /\A[a-zA-Z0-9]+\Z/ , message: "Letters and numbers only." } 
  validates :password, presence: true, length: { in: 5..20 }, on: :create

  has_many :posts
  has_many :comments
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id"
  has_many :leaders, class_name: "Relationship", foreign_key: "leader_id"
  has_many :mentioned, class_name: "Mention", foreign_key: "mention_at_id"
  has_many :mentions, class_name: "Mention", foreign_key: "mention_by_id"
  has_many :notices_by, class_name: "Notice", foreign_key: "to_id"
  has_many :notices_to, class_name: "Notice", foreign_key: "from_id"
  
  has_secure_password validation: false

  def followers
    Relationship.where(leader: id).map(&:follower)
  end

  def leaders
    Relationship.where(follower: id).map(&:leader)
  end

  def follow?(leader)
    leader.followers.include?(self)
  end

  def to_param
    username
  end
end