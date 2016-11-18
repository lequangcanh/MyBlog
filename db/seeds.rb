# Create users
User.create!(name:  "Le Quang Canh",
             email: "lequangcanh94@gmail.com",
             password:              "123456",
             password_confirmation: "123456")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123456"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Create entries
users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(3)
  content = Faker::Lorem.paragraph(3)
  users.each { |user| user.entries.create!(title: title, content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
