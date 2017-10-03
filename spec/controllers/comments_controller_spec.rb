require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  context 'If user login as guest' do
    before do
      @user = FactoryGirl.create(:user, email: Faker::Internet.email)
      sign_in @user
      @song = FactoryGirl.create(:song)
    end

    it '#Comment Song' do
      @comment = FactoryGirl.create(:comment)
      expect do
        post :create, params: { song_id: @song.id, user_id: @user.id,
        content: Faker::Lorem.characters,
        parent_id: @comment.id, format: :js }
      end.to change(Comment, :count).by(1)
    end

    it '#Delete Comment' do
      @comment = Comment.create(song_id: @song.id, user_id: @user.id)
      expect do
        delete :destroy, params: { id: @comment.id,
                                   song_id: @song.id, format: :js }
      end.to change(Comment, :count).by(-1)
    end

    it '#Edit Comment' do
      @comment = Comment.create(song_id: @song.id,
                                user_id: @user.id, content: 'abc')
      patch :update, params: { id: @comment.id,
                               song_id: @song.id, content: 'aaa', format: :js }
      @comment.reload
      expect(@comment.content).to eq('aaa')
    end
  end
end
