require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'db schema' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:picture).of_type(:string) }
      it { should have_db_column(:count_view).of_type(:integer) }
      it { should have_db_column(:singer_id).of_type(:integer) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:picture) }
  end

  it 'is valid with a name and picture' do
    album = Album.new(
      name: Faker::Name.name,
      picture: File.open('app/assets/images/thumbnail.jpg')
    )
    expect(album).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:singer) }
    it { should have_many(:songs).through(:album_songs) }
    it { should have_many(:album_songs).dependent(:destroy) }
    it { should have_many(:categories).through(:album_categories) }
    it { should have_many(:album_categories).dependent(:destroy) }
  end
end
