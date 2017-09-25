class FavoritesController < ApplicationController
  before_action :load_favorite, only: %i[create show destroy]
  before_action :find_song, only: %i[create destroy]

  def create
    return unless user_signed_in?
    @favorite = @song.favorites.new(user_id: current_user.id,
      name: params[:name])
    @favorite.save
    respond_to do |format|
      format.js
    end
  end

  def show
    @favorite = Favorite.find_by id: params[:id]
    @favorite.update_attribute(:count_view, @favorite.count_view + 1)
  end

  def destroy
    @favorite = Favorite.find_by id: params[:id], user_id: current_user.id
    @favorite.destroy
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
