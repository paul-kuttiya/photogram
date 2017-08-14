Fabricator(:post) do
  location { Faker::Address.street_name }
  caption { Faker::Lorem.paragraph(1) }
  
  image do
    File.open(Rails.root + Dir["public/images/*"].sample)
  end
  
  user { User.all.sample }
end