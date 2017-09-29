FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password 'a123456'
    phonenumber Faker::PhoneNumber.phone_number
    confirmed_at Date.today
    is_admin false
  end
end
