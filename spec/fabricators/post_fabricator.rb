Fabricator(:post) do
  location { Faker::Address.street_name }
  caption { Faker::Lorem.paragraph(1) }
  
  user { User.all.sample }

  image do
    File.open(Rails.root + Dir["public/images/*"].sample)
  end
end