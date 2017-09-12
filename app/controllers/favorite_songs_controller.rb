class FavoriteSongsController < ApplicationController

  def create
    @favorites = Favorite.all
    @song = Song.find_by id: params[:song_id]
    @favorite = Favorite.find_by id: params[:favorite_id]
    @favoritesong = @song.favorite_songs.create!(favorite_id: params[:favorite_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favorites = Favorite.all
    @song = Song.find_by id: params[:song_id]
    @favoritesong = FavoriteSong.find_by id: params[:id]
    @favoritesong.destroy
    respond_to do |format|
      format.js
    end
  end
end
