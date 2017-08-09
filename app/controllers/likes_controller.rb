class LikesController < ApplicationController

  def create
    @song = Song.find_by id: params[:song_id]
    @like = @song.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @like = Like.find_by(song_id: params[:id], user_id: current_user.id).destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

end
