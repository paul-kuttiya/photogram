Fabricator(:tag) do
  name { Faker::Address.unique.state.downcase.gsub(/\s/, '') }
end