module Mixin

  module Voteable
    extend ActiveSupport::Concern

    included do
      has_many :votes, as: :voteable
    end

    def likes(model)
      Vote.where(voteable_type: model.titleize, user: self)
    end

    def liked_by?(user)
      !!votes.find_by(user: user)
    end

    def total_votes
      Vote.where(vateable: self, vote: true).length
    end
  end

  module Noticeable
    extend ActiveSupport::Concern

    included do
      has_many :notices, as: :noticeable
    end
  end
end