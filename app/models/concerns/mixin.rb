module Mixin

  module Voteable
    extend ActiveSupport::Concern

    included do
      has_many :votes, as: :voteable
    end

    def likes(model)
      Vote.where(voteable_type: model.titleize, user: self)
    end
  end

  module Noticeable
    extend ActiveSupport::Concern

    included do
      has_many :notices, as: :noticeable
    end
  end
end