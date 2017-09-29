require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'db schema' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:file_song).of_type(:string) }
      it { should have_db_column(:picture).of_type(:string) }
      it { should have_db_column(:content).of_type(:string) }
      it { should have_db_column(:count_view).of_type(:integer) }
      it { should have_db_column(:author_id).of_type(:integer) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_presence_of(:picture) }
    it { should validate_presence_of(:file_song) }
    it { should validate_presence_of(:content) }
  end

  it 'is valid with a name, picture, file_song, and content' do
    song = Song.new(
      name: Faker::Name.name,
      picture: File.open('app/assets/images/1304.jpg'),
      file_song: File.open(
        'app/assets/images/Noi-Nay-Co-Anh-Son-Tung-M-TP.mp3'
      ),
      content: Faker::Lorem.paragraphs
    )
    expect(song).to be_valid
  end

  describe 'associations' do
    it { should have_many(:categories).through(:category_songs) }
    it { should have_many(:category_songs).dependent(:destroy) }
    it { should have_many(:singers).through(:singer_songs) }
    it { should have_many(:singer_songs).dependent(:destroy) }
    it { should have_many(:albums).through(:album_songs) }
    it { should have_many(:album_songs).dependent(:destroy) }
    it { should have_many(:users).through(:user_songs) }
    it { should have_many(:user_songs).dependent(:destroy) }
    it { should have_many(:favorites).through(:favorite_songs) }
    it { should have_many(:favorite_songs).dependent(:destroy) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
    it { should belong_to(:author) }
  end
end
