Fabricator(:comment) do
  description { Faker::Lorem.sentences(1) }
end