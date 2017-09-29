require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'db schema' do
    context 'columns' do
      it { should have_db_column(:image).of_type(:string) }
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:address).of_type(:string) }
      it { should have_db_column(:phonenumber).of_type(:integer) }
      it { should have_db_column(:is_admin).of_type(:boolean) }
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
    it { should validate_length_of(:phonenumber) }
  end

  it 'is valid with a name, email, password, and phonenumber' do
    user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'a123456',
      phonenumber: Faker::PhoneNumber.phone_number
    )
    expect(user).to be_valid
  end

  describe 'associations' do
    it { should have_many(:likes) }
    it { should have_many(:comments) }
    it { should have_many(:songs).through(:user_songs) }
    it { should have_many(:user_songs).dependent(:destroy) }
    it { should have_many(:favorite) }
  end

  describe 'callback' do
    it { should callback(:downcase_email).before(:save) }
  end
end
