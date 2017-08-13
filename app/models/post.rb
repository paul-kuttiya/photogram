class Post < ActiveRecord::Base
  validates_presence_of :image
  belongs_to :user

  mount_uploader :image, PhotoUploader

  before_create :generate_token

  def to_param
    token
  end

  def generate_token
    self.token = self.class.generate_token
  end

  def self.generate_token(length=5)
    token = loop do
      random_token = SecureRandom.hex(length)
      break random_token if !exists?(token: random_token)
    end
  end
end