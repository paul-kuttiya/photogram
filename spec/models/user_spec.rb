describe User do
  it { should validate_presence_of :username }  
  it { should validate_presence_of :full_name }  
  it { should validate_presence_of :email }  
  it { should validate_presence_of :password }  
  it { should validate_uniqueness_of :username }
  it { should validate_uniqueness_of :email }
  it { should ensure_length_of(:username).is_at_least(5).is_at_most(20) }
  it { should ensure_length_of(:email).is_at_least(5).is_at_most(20) }
  it { should ensure_length_of(:password).is_at_least(5).is_at_most(20) }
  it { have_secure_password }
end