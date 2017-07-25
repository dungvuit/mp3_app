class SongController < ApplicationController

  before_action :find_song, only: :show

  def index
    @songs = Song.all
  end

  def show
  end

  private

  def find_song
    @song = Song.find_by id: params[:id]
  end
end
