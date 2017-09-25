class FavoriteSongsController < ApplicationController
  before_action :load_favorite, only: %i[create destroy]
  before_action :find_song, only: %i[create destroy]

  def create
    @favorite = Favorite.find_by id: params[:favorite_id]
    @favoritesong = @song.favorite_songs.create!(
      favorite_id: params[:favorite_id]
    )
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favoritesong = FavoriteSong.find_by id: params[:id]
    @favoritesong.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def load_favorite
    @favorites = Favorite.all
  end

  def find_song
    @song = Song.find_by id: params[:song_id]
  end
end
