class Admins::SongsController < ApplicationController
  layout "application_admin"

  before_action :check_user_logged, :verify_admin
  before_action :find_song, except: %i[index new create]
  before_action :load_data, only: %i[index new edit]

  def index
    @songs = if params[:song_name].present? || params[:singer_name].present? ||
      params[:category_name].present? || params[:author_name].present?
      Song.search_song params[:song_name], params[:singer_name],
        params[:category_name], params[:author_name]
    else
      Song
    end.sort_by_create_at
    respond_to do |format|
      format.html
      format.js
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
      render :new
    end
  end

  def edit; end

  def update
    if @song.update_attributes song_params
      redirect_to admins_songs_path
      flash[:success] = "Song Edit Successfully!"
    else
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
