class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password
  validates_presence_of :password, on: :create
  validates_uniqueness_of :username, :email, case_sensitive: false
  validates :username, length: { in: 5..20 }
  validates :password, length: { in: 5..20 }  

  has_secure_password validation: false

  def to_param
    username
  end
end