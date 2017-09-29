require 'rails_helper'

RSpec.describe Singer, type: :model do
  describe 'db schema' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:picture).of_type(:string) }
      it { should have_db_column(:date_of_birth).of_type(:date) }
      it { should have_db_column(:gender).of_type(:integer) }
      it { should have_db_column(:address).of_type(:string) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:picture) }
    it { should validate_presence_of(:date_of_birth) }
  end

  it 'is valid with a name, picture, and date_of_birth' do
    singer = Singer.new(
      name: Faker::Name.name,
      picture: File.open('app/assets/images/1304.jpg'),
      date_of_birth: Faker::Date.birthday(18, 65)
    )
    expect(singer).to be_valid
  end

  describe 'associations' do
    it { should have_many(:songs).through(:singer_songs) }
    it { should have_many(:singer_songs).dependent(:destroy) }
    it { should have_many(:album) }
  end
end
