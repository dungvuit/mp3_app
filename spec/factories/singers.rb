FactoryGirl.define do
  factory :singer do
    name Faker::Book.author
    picture File.open('app/assets/images/1304.jpg')
    date_of_birth Faker::Date.birthday(18, 65)
    address Faker::Address.street_address
  end
end
