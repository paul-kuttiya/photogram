class Relationship < ActiveRecord::Base
  include Mixin::Noticeable
  
  belongs_to :leader, class_name: "User"
  belongs_to :follower, class_name: "User"

  validates_uniqueness_of :follower_id, scope: [:leader_id]
  validate :follow_itself

  def follow_itself
    errors.add(:follower, "cannot follow itself.") if follower == leader
  end
end
