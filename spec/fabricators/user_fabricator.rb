Fabricator(:user) do
  email { Faker::Internet.unique.email }
  username { Faker::Internet.unique.user_name(5..20).gsub(/[^a-zA-Z0-9]/, '') }
  full_name { Faker::Name.unique.name }
  password { Faker::Internet.password }
  bio { Faker::Lorem.paragraph(3) }
  website { Faker::Internet.url }
end