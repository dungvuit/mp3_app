require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'db schema' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  it 'is valid with a name' do
    category = Category.new(
      name: Faker::Name.name
    )
    expect(category).to be_valid
  end

  describe 'associations' do
    it { should have_many(:songs).through(:category_songs) }
    it { should have_many(:category_songs).dependent(:destroy) }
    it { should have_many(:albums).through(:album_categories) }
    it { should have_many(:album_categories).dependent(:destroy) }
  end

  describe 'callback' do
    it { should callback(:capitalize_name).before(:save) }
  end
end
