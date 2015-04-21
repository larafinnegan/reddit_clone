=begin
User.create!(username:  "Frank2",
             email: "example@example.org",
             password:              "foobar",
             password_confirmation: "foobar")

20.times do |n|
  username  = Faker::Internet.user_name
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
end
=end

Sub.create(name: "funny")
Sub.create(name: "aww")
Sub.create(name: "personalfinance")
Sub.create(name: "gaming")
Sub.create(name: "earthporn")
Sub.create(name: "books")
Sub.create(name: "movies")
Sub.create(name: "askscience")

Post.create!(title: "This is a post",
             content: "post post post",
             sub_id: 1,
             user_id: 3)

80.times do |n|
  title  = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph
  sub_id = (rand(8) + 1)
  user_id = (rand(21) + 1)
  created_at = (Time.now - rand(30000000))

  Post.create!(title: title,
               content: content,
               sub_id: sub_id,
               user_id: user_id,
               created_at: created_at)
end
