module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  def generate_token
    self.token = self.class.generate_token
  end

  module ClassMethods
    def generate_token(length=5)
      token = loop do
        random_token = SecureRandom.hex(length)
        break random_token if !exists?(token: random_token)
      end
    end
  end

  def to_param
    token
  end

  def to_t
    self.id
  end
end