Fabricator(:post) do
  location { Faker::Address.street_name }
  caption { Faker::Lorem.paragraph(1) }
  user { User.all.sample }

  if Rails.env.development? || Rails.env.test?
    image do
      File.open(Rails.root + Dir["public/post_images/*"].sample)
    end
  end
end