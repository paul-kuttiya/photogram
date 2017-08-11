Fabricator(:user) do
  email { Faker::Internet.unique.email }
  username { Faker::Internet.unique.user_name(5..20) }  
  full_name { Faker::Name.unique.name }
  password { Faker::Internet.password }
end