describe User do
  it { should validate_presence_of :username }  
  it { should validate_presence_of :email }  
  it { should validate_presence_of(:password).on(:create) }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should ensure_length_of(:username).is_at_least(5).is_at_most(20) }
  it { should ensure_length_of(:password).is_at_least(5).is_at_most(20) }
  it { have_secure_password }
end