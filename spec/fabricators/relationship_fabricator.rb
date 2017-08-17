Fabricator(:relationship) do
  follower { User.all.sample }
  leader { User.all.sample }
end