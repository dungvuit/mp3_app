class SongController < ApplicationController

  before_action :find_song, only: :show

  def index
    @songs = Song.all
  end

  def show
    @song.update_attribute(:count_view, @song.count_view + 1)
  end

  private

  def find_song
    @song = Song.find_by id: params[:id]
  end
end
