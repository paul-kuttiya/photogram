class Vote < ActiveRecord::Base
  include Mixin::Noticeable
  
  belongs_to :user
  belongs_to :voteable, polymorphic: true
end