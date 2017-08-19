class Mention < ActiveRecord::Base
  belongs_to :mention_at, class_name: "User"
  belongs_to :mention_by, class_name: "User"
  belongs_to :post
end