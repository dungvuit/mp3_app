class Admins::AlbumsController < ApplicationController
  layout "application_admin"

  before_action :check_user_logged, :verify_admin
  before_action :find_album, except: %i[index new create]
  before_action :load_data, only: %i[index new edit]

  def index
    @albums = if params[:search].present?
      Album.search_by_name(params[:search])
    else
      Album
    end.sort_by_create_at
    @album = Album.new
    respond_to do |format|
      format.html
      format.js
      format.xls {send_data @albums.to_csv(col_sep: "\t")}
    end
  end

  def create
    @album = Album.new album_params
    if @album.save
      flash[:success] = "Create Album Successfully!"
      redirect_to admins_albums_path
    else
      load_data
    end
  end

  def edit; end

  def update
    if @album.update_attributes album_params
      redirect_to admins_albums_path
      flash[:success] = "Album Edit Successfully!"
    else
      load_data
      render :edit
    end
  end

  def destroy
    if @album.destroy
      flash[:success] = "Album Delete Successfully!"
    else
      flash[:danger] = "Can't delete album"
    end
    redirect_to admins_albums_path
  end

  private
  def find_album
    @album = Album.find_by id: params[:id]
    unless @album
      flash[:danger] = "Album not exist"
      redirect_to admins_albums_path
    end
  end

  def album_params
    params.require(:album).permit :name, :picture, :singer_id, :category_ids
  end

  def load_data
    @supports = Supports::Relationship.new
  end
end
