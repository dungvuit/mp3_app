User.create!(
  name: "admin",
  email: "admin@gmail.com",
  password: "matkhau123",
  password_confirmation: "matkhau123",
  is_admin: true
  )

30.times do |n|
  image = File.open('app/assets/images/default-image.png')
  name = "User#{n}"
  email = "user#{n}@gmail.com"
  password = "matkhau123"
  password_confirmation = "matkhau123"
  phonenumber = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address
  user = User.create name: name, email: email, password: password,
    password_confirmation: password_confirmation, phonenumber: phonenumber,
      address: address, image: image
end

50.times do |n|
  name = Faker::Book.publisher
  author = Author.create name: name
end

50.times do |n|
  name = Faker::Book.author
  picture = File.open('app/assets/images/1304.jpg')
  dob = Faker::Date.birthday(18, 65)
  address = Faker::Address.street_address
  singer = Singer.create name: name, picture: picture, dob: dob,
    address: address
end

10.times do |n|
  name = Faker::Book.genre
  category = Category.create name: name
end

50.times do |n|
  name = "Nhạc hot tháng 8"
  picture = File.open('app/assets/images/thumbnail.jpg')
  singer_id = Faker::Number.between(1, 50)
  category_ids = Faker::Number.between(1, 10)
  album = Album.create name: name, picture: picture,
    singer_id: singer_id, category_ids: category_ids
end

50.times do |n|
  name = Faker::Book.title
  content = Faker::Lorem.paragraphs
  picture = File.open('app/assets/images/1304.jpg')
  url_song = File.open('app/assets/images/Noi-Nay-Co-Anh-Son-Tung-M-TP.mp3')
  author_id = Faker::Number.between(1, 50)
  category_ids = Faker::Number.between(1, 50)
  singer_ids = Faker::Number.between(1, 50)
  album_ids = Faker::Number.between(1, 50)
  song = Song.create name: name, content: content, picture: picture, url_song: url_song,
      author_id: author_id, category_ids: category_ids, singer_ids: singer_ids,
        album_ids: album_ids
end
