class Notice < ActiveRecord::Base
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"  
  belongs_to :noticeable, polymorphic: true
  belongs_to :post

  # validates_uniqueness_of :post_id, scope: [:noticeable], allow_nil: true
  
  # extra validation in model and controller
  # necessary?
  def self.create_notice(from, to, noticeable, post)
    #prevent duplication
    unless exists?(from: from, to: to, noticeable: noticeable)
      create(from: from, to: to, noticeable: noticeable, post: post)
    end
  end

  def self.create_follow_notice(from, to, noticeable)
    unless exists?(from: from, to: to, noticeable_type: noticeable.class.to_s)
      create(from: from, to: to, noticeable: noticeable)
    end
  end
end