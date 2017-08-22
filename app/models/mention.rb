class Mention < ActiveRecord::Base
  include Mixin::Noticeable

  belongs_to :mention_at, class_name: "User"
  belongs_to :mention_by, class_name: "User"
  belongs_to :post
  validates_uniqueness_of :mention_by_id, scope: [:mention_at_id, :post_id]

  #extra validation in model and controller
  #user mention creates once per post
  def self.create_user_mention(at, by, post)
    unless exists?(mention_at: at, mention_by: by, post: post)
      create(mention_at: at, mention_by: by, post: post)
    end
  end
end