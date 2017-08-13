Fabricator(:post) do
  location { Faker::Address.street_name }
  caption { Faker::Lorem.paragraph(1) }
  image { './images/sample.jpg' }
end