Fabricate(:user, username: "admin", password: "admin")

20.times do
  gender = ["men", "women"].sample
  n = (1..99).to_a.sample
  if Rails.env.production?
    Fabricate(:user,
      remote_avatar_url: "https://pkuttiya-photogram.s3.us-east-2.amazonaws.com/avatars/avatar_#{gender}_#{n}.jpg"
    )
  else
    Fabricate(:user,
      avatar: File.open(Rails.root + Dir["public/avatars/*"].sample)
    )
  end
end

50.times { Fabricate(:tag) }

#tag and post
200.times do
  tags = Tag.all.sample(3)
  hashtags = tags.map{ |tag| "##{tag.name}" }
  
  if Rails.env.production?
    post = Fabricate(:post, 
      caption: hashtags.join(' ') + ' ' + Faker::Lorem.paragraph(1),
      remote_image_url: "https://pkuttiya-photogram.s3.us-east-2.amazonaws.com/avatars/avatar_men_1.jpg"  
    )
  else
    post = Fabricate(:post, caption: hashtags.join(' ') + ' ' + Faker::Lorem.paragraph(1))
  end

  post.tags = tags
end

#comment
400.times do
  Fabricate(:comment, post: Post.all.sample, user: User.all.sample)
end

#like
3000.times do
  user = User.all.sample
  post = Post.all.sample
  
  next if Vote.find_by(user: user, voteable: post)
  Vote.create(user: user, voteable: post, vote: true)
end

#relationship
200.times do 
  follower = User.all.sample
  leader = User.all.sample

  next if follower == leader || Relationship.find_by(follower: follower, leader: leader)
  Relationship.create(follower: follower, leader: leader)
end

FileUtils.remove_dir "#{Rails.root}/public/uploads/tmp", true