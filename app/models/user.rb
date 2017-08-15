class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email, case_sensitive: false
  validates :username, length: { in: 5..20 }
  validates :password, presence: true, length: { in: 5..20 }, on: :create

  has_many :posts
  has_many :comments
  has_secure_password validation: false

  def to_param
    username
  end
end