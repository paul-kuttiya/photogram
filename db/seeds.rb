# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fabricate(:user, username: "admin", password: "admin")

15.times do 
  Fabricate(:user)
end

200.times do
  Fabricate(:post)
end

300.times do
  Fabricate(:comment, post: Post.all.sample, user: User.all.sample)
end


200.times do 
  follower = User.all.sample
  leader = User.all.sample

  next if follower == leader || Relationship.find_by(follower: follower, leader: leader)
  Relationship.create(follower: follower, leader: leader)
end