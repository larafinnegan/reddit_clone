50.times do |n|
  username  = Faker::Internet.user_name + n.to_s
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
end

subs = ["funny", "aww", "personalfinance", "gaming", "earthporn", "books", "movies", "askscience", "news", "pics"]

subs.each { |sub| Sub.create(name: sub) }

100.times do |n|
  title  = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph
  sub_id = (rand(10) + 1)
  user_id = (rand(50) + 1)
  created_at = (Time.now - rand(30000000))

  @post = Post.create!(title: title,
               content: content,
               sub_id: sub_id,
               user_id: user_id,
               created_at: created_at)

  num = rand(50)

  (1..num).each do |m|
  content = Faker::Lorem.paragraph
  user_id = (rand(50) + 1)
  Comment.last ? parent_id = Comment.last.id - rand(m) : parent_id = 0
  post_id = @post.id
  created_at = Time.now - rand((Time.now - @post.created_at)) 

  Comment.create!(content: content,
               user_id: user_id,
               parent_id: parent_id,
               post_id: post_id,
               created_at: created_at)
end
end