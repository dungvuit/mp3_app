class Admins::SongsController < ApplicationController
  layout "application_admin"

  before_action :find_song, except: %i[index new create]
  before_action :load_data, only: %i[index new edit]

  def index
    @songs = Song.sort_by_create_at.paginate page: params[:page]
    respond_to do |format|
      format.html
      format.xls {send_data @songs.to_csv(col_sep: "\t")}
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new song_params
    if @song.save
      flash[:success] = "Create Song Successfully!"
      redirect_to admins_songs_path
    else
      load_data
      render :new
    end
  end

  def edit; end

  def update
    if @song.update_attributes song_params
      redirect_to admins_songs_path
      flash[:success] = "Song Edit Successfully!"
    else
      load_data
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:success] = "Song Delete Successfully!"
    redirect_to admins_songs_path
  end

  private

  def find_song
    @song = Song.find_by id: params[:id]
    unless @song
      flash[:danger] = "Song not exits!"
      redirect_to admins_songs_path
    end
  end

  def song_params
    params.require(:song).permit :name, :content, :picture, :url_song,
      :author_id, :category_ids, :singer_ids
  end

  def load_data
    @supports = Supports::Relationship.new
  end
end
