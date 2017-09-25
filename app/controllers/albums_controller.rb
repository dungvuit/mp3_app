class AlbumsController < ApplicationController
  before_action :find_album, only: %i[show edit update destroy]

  def show
    @album.update_attribute(:count_view, @album.count_view + 1)
  end

  def album_song
    @song = Song.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

  def find_album
    @album = Album.find_by id: params[:id]
    return if @album
    flash[:danger] = 'Album not exist'
    redirect_to root_path
  end
end
