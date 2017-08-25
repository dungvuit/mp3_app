User.create!(
  name: "admin",
  email: "admin@gmail.com",
  password: "Thangban12",
  password_confirmation: "Thangban12",
  is_admin: true
  )

# 10.times do |n|
#   name = Faker::Name.name
#   author = Author.create name: name
# end

# 10.times do |n|
#   name = Faker::Name.name
#   picture = Faker::Avatar.image("my-own-slug", "50x50", "jpg")
#   dob = Faker::Date.birthday(18, 65)
#   address = Faker::Address.street_address
#   singer = Singer.create name: name, picture: picture, dob: dob,
#     address: address
# end

# 10.times do |n|
#   name = Faker::Music.chord
#   category = Category.create name: name
# end
