Fabricator(:post) do
  location { Faker::Address.street_name }
  caption { Faker::Lorem.paragraph(1) }
  
  image do
    File.open(Rails.root + Dir["app/assets/images/seed/*"].sample)
  end
  
  user { User.all.sample }
end