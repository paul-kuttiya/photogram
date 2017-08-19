class User < ActiveRecord::Base
  include Mixin::Voteable

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
  has_many :mentioned, class_name: "Mention", foreign_key: "mention_at_id" #mentions at me
  has_many :mentions, class_name: "Mention", foreign_key: "mention_by_id" #mentions from me
  
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