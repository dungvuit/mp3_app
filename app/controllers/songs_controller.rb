class SongsController < ApplicationController

  before_action :check_user_logged, only: %i[new create]
  before_action :find_song, except: %i[index new create search]
  before_action :load_data, only: %i[index new edit]

  def index
    @songs = Song.top
    @categories = Category.limit(5)
    @albums = Album.limit(6)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new song_params
    if @song.save
      flash[:success] = "Create Song Successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @song.update_attribute(:count_view, @song.count_view + 1)
    @favorites = Favorite.all
  end

  def edit; end

  def update
    if @song.update_attributes song_params
      redirect_to root_path
      flash[:success] = "Song Edit Successfully!"
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:success] = "Song Delete Successfully!"
    redirect_to root_path
  end

  def search
    if params[:search].present?
      @songs = Song.search_song_client(params[:search])
    else
      @songs = Song.all
    end
  end

  private

  def find_song
    @song = Song.find_by id: params[:id]
    unless @song
      flash[:danger] = "Song not exits!"
      redirect_to root_path
    end
  end

  def song_params
    params.require(:song).permit :name, :content, :picture, :file_song,
      :author_id, :category_ids, :singer_ids
  end

  def load_data
    @supports = Supports::Relationship.new
  end
end
