class User < ActiveRecord::Base
  validates_presence_of :username, :full_name, :email, :password
  validates_uniqueness_of :username, :email
  validates :username, length: { in: 5..20 }
  validates :email, length: { in: 5..20 }  
  validates :password, length: { in: 5..20 }  

  has_secure_password validation: false
end