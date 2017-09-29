FactoryGirl.define do
  factory :album do
    name Faker::Name.name
    picture File.open('app/assets/images/thumbnail.jpg')
  end
end
