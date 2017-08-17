module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end

  def likes(model)
    Vote.where(voteable_type: model.titleize, user: self)
  end
end