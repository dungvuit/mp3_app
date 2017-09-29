require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  context 'If user login as guest' do

    before do
      @user = FactoryGirl.create(:user, email: Faker::Internet.email)
      sign_in @user
    end

    it '#Like Song' do
      @song = FactoryGirl.create(:song)
      expect do
        post :create, params: { song_id: @song.id, user_id: @user.id, format: :js }
      end.to change(Like, :count).by(1)
    end

    it '#Dislike Song' do
      @song = FactoryGirl.create(:song)
      @like = Like.create(song_id: @song.id, user_id: @user.id)
      expect do
        delete :destroy, params: { id: @song.id, format: :js }
      end.to change(Like, :count).by(-1)
    end
  end
end
