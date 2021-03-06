module Admins
  class AlbumsController < ApplicationController
    layout 'application_admin'

    before_action :check_user_logged, :verify_admin
    before_action :find_album, except: %i[index new create]
    before_action :load_data, only: %i[index new edit]

    def index
      @albums = Album.index_albums params
      @album = Album.new
      respond_to do |format|
        format.html
        format.js
        format.xls { send_data Album.to_csv(col_sep: "\t") }
      end
    end

    def create
      @album = Album.new album_params
      if @album.save
        flash[:success] = 'Create Album Successfully!'
        redirect_to admins_albums_path
      else
        load_data
        render :new
      end
    end

    def edit; end

    def update
      if @album.update_attributes album_params
        redirect_to admins_albums_path
        flash[:success] = 'Album Edit Successfully!'
      else
        load_data
        render :edit
      end
    end

    def destroy
      if @album.destroy
        flash[:success] = 'Album Delete Successfully!'
      else
        flash[:danger] = 'Cant delete album'
      end
      redirect_to admins_albums_path
    end

    private

    def find_album
      @album = Album.includes(:songs, songs: :author)
                    .includes(:songs, songs: :categories)
                    .includes(:songs, songs: :singers)
                    .find_by id: params[:id]
      return if @album
      flash[:danger] = 'Album not exist'
      redirect_to admins_albums_path
    end

    def album_params
      params.require(:album).permit :name, :picture, :singer_id, :category_ids
    end

    def load_data
      @supports = Supports::Relationship.new
    end
  end
end
