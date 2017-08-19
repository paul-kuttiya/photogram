class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def has_mention?
    mention_users.present?
  end

  def mention_users
    description.scan(/@\w+/).map { |mention| mention[1..-1].downcase }
  end
end