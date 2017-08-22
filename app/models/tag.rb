class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags

  def to_param
    name
  end

  def self.find_or_create_new(tag)
    exists?(name: tag) ? find_by(name: tag) : create(name: tag) 
  end
end