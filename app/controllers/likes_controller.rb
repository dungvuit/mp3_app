class LikesController < ApplicationController
  before_action :find_song, only: %i[create destroy]

  def create
    return unless user_signed_in?
    @like = @song.likes.create!(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @like = Like.find_by(song_id: params[:id], user_id: current_user.id).destroy
    respond_to do |format|
      format.js
    end
  end

  def find_song
    @song = Song.find_by id: params[:song_id]
  end
end
