require 'rails_helper'

RSpec.describe Admins::SingersController, type: :controller do
  context 'Manager singer if user is admin' do
    before do
      user = FactoryGirl.create(:user, is_admin: true,
                                       email: Faker::Internet.email)
      sign_in user
    end

    it 'GET #index' do
      get :index
      expect(response).to be_success
    end

    it 'Create singer' do
      test_image = 'app/assets/images' + '/1304.jpg'
      file = Rack::Test::UploadedFile.new(test_image, 'image/jpeg')
      expect do
        post :create, params: { singer: { name: Faker::Name.name,
                                          picture: file,
                                          date_of_birth: Faker::Date.birthday(
                                            18, 65
                                          ) } }
      end.to change(Singer, :count).by(1)
    end

    it '#Edit Singer' do
      test_image = 'app/assets/images' + '/1304.jpg'
      file = Rack::Test::UploadedFile.new(test_image, 'image/jpeg')
      @singer = FactoryGirl.create(:singer)
      patch :update, params: {
        id: @singer.id, singer: { name: Faker::Name.name,
                                  picture: file,
                                  date_of_birth: Faker::Date.birthday(18, 65) }
      }
      expect(response).to redirect_to(admins_singers_path)
    end

    it 'Delete author' do
      @singer = FactoryGirl.create(:singer)
      expect do
        delete :destroy, params: { id: @singer.id }
      end.to change(Singer, :count).by(-1)
    end
  end
end
