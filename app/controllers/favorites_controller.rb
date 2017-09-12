class FavoritesController < ApplicationController

  def create
    @favorites = Favorite.all
    @song = Song.find_by id: params[:song_id]
    @favorite = @song.favorites.create!(user_id: current_user.id, name: params[:name])
    respond_to do |format|
      format.js
    end
  end

  def show
    @favorites = Favorite.all
    @favorite = Favorite.find_by id: params[:id]
    @favorite.update_attribute(:count_view, @favorite.count_view + 1)
  end

  def destroy
    @favorites = Favorite.all
    @song = Song.find_by id: params[:id]
    @favorite = Favorite.find_by id: params[:id], user_id: current_user.id
    @favorite.destroy
    respond_to do |format|
      format.js
    end
  end
end
