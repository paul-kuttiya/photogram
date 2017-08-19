hashtags = ["#italy", "#asia", "#good_life", "#superstar", "#young_money"].sample

Fabricator(:post) do
  location { Faker::Address.street_name }
  caption { hashtags + ' ' + Faker::Lorem.paragraph(1) }
  
  user { User.all.sample }

  image do
    File.open(Rails.root + Dir["public/post_images/*"].sample)
  end
end