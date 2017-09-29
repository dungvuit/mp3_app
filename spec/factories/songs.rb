FactoryGirl.define do
  factory :song do
    name Faker::Book.title
    content Faker::Lorem.paragraphs
    picture File.open('app/assets/images/1304.jpg')
    file_song File.open('app/assets/images/Noi-Nay-Co-Anh-Son-Tung-M-TP.mp3')
  end
end
