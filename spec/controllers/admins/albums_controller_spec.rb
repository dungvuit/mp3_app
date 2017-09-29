require 'rails_helper'

RSpec.describe Admins::AlbumsController, type: :controller do
  context 'Manager Album if user is admin' do
    before do
      user = FactoryGirl.create(:user, is_admin: true,
                                       email: Faker::Internet.email)
      sign_in user
    end

    it '#GET albums' do
      get :index
      expect(response).to be_success
    end

    it '#Create album' do
      test_image = 'app/assets/images' + '/thumbnail.jpg'
      file = Rack::Test::UploadedFile.new(test_image, 'image/jpeg')
      expect do
        post :create, params: { album: { name: Faker::Name.name,
                                         picture: file } }
      end.to change(Album, :count).by(1)
    end

    it '#Show album' do
      @album = FactoryGirl.create(:album)
      get :show, params: { id: @album.id }
      expect(response).to be_success
    end

    it '#Edit album' do
      test_image = 'app/assets/images' + '/thumbnail.jpg'
      file = Rack::Test::UploadedFile.new(test_image, 'image/jpeg')
      @album = FactoryGirl.create(:album)
      FactoryGirl.create(:category)
      FactoryGirl.create(:singer)
      patch :update, params: { id: @album.id, album: { name: Faker::Name.name,
                               picture: file,
                               singer_id: 1,
                               category_ids: 1 } }
      expect(response).to redirect_to(admins_albums_path)
    end

    it '#Delete album' do
      @album = FactoryGirl.create(:album)
      expect do
        delete :destroy, params: { id: @album.id }
      end.to change(Album, :count).by(-1)
    end
  end
end
