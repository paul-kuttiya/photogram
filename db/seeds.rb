# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fabricate(:user, username: "admin", password: "admin")

15.times do 
  Fabricate(:user,
    avatar: File.open(Rails.root + Dir["public/avatars/*"].sample)
  )
end

50.times { Fabricate(:tag) }

200.times do
  tags = Tag.all.sample(3)
  hashtags = tags.map{ |tag| "##{tag.name}" }
  
  post = Fabricate(:post, caption: hashtags.join(' ') + ' ' + Faker::Lorem.paragraph(1))
  post.tags = tags
end

400.times do
  Fabricate(:comment, post: Post.all.sample, user: User.all.sample)
end

3000.times do
  user = User.all.sample
  post = Post.all.sample
  
  next if Vote.find_by(user: user, voteable: post)
  Vote.create(user: user, voteable: post, vote: true)
end

200.times do 
  follower = User.all.sample
  leader = User.all.sample

  next if follower == leader || Relationship.find_by(follower: follower, leader: leader)
  Relationship.create(follower: follower, leader: leader)
end