require 'rails_helper'

RSpec.describe Admins::SongsController, type: :controller do
  context 'Manager Song if user is admin' do
    before do
      user = FactoryGirl.create(:user, is_admin: true,
                                       email: Faker::Internet.email)
      sign_in user
    end

    it 'GET #index' do
      get :index
      expect(response).to be_success
    end

    it 'Create song' do
      test_image = 'app/assets/images' + '/thumbnail.jpg'
      file = Rack::Test::UploadedFile.new(test_image, 'image/jpeg')
      test_mp3 = 'app/assets/images' + '/Noi-Nay-Co-Anh-Son-Tung-M-TP.mp3'
      file_song = Rack::Test::UploadedFile.new(test_mp3, 'mp3/wav')
      expect do
        post :create, params: { song: { name: Faker::Name.name,
                                         picture: file,
                                         file_song: file_song,
                                         content: Faker::Lorem.name } }
      end.to change(Song, :count).by(1)
    end

    it '#Edit song' do
      test_image = 'app/assets/images' + '/thumbnail.jpg'
      file = Rack::Test::UploadedFile.new(test_image, 'image/jpeg')
      test_mp3 = 'app/assets/images' + '/Noi-Nay-Co-Anh-Son-Tung-M-TP.mp3'
      file_song = Rack::Test::UploadedFile.new(test_mp3, 'mp3/wav')
      @song = FactoryGirl.create(:song)
      patch :update, params: {
        id: @song.id, song: { name: Faker::Name.name,
                                  picture: file,
                                  file_song: file_song,
                                  content: Faker::Lorem.name }
      }
      expect(response).to redirect_to(admins_songs_path)
    end

    it 'Delete song' do
      @song = FactoryGirl.create(:song)
      expect do
        delete :destroy, params: { id: @song.id }
      end.to change(Song, :count).by(-1)
    end
  end
end
