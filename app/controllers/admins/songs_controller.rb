module Admins
  class SongsController < ApplicationController
    layout 'application_admin'

    before_action :check_user_logged, :verify_admin
    before_action :find_song, except: %i[index new create]
    before_action :load_data, only: %i[index new edit]

    def index
      @songs = if query_present? params
                 Song.search_song(params[:song_name],
                                  params[:singer_name],
                                  params[:category_name],
                                  params[:author_name])
               else
                 Song.sort_by_create_at
               end.paginate page: params[:page], per_page: 5
      respond_to do |format|
        format.html
        format.js
        format.xls { send_data @songs.to_csv(col_sep: "\t") }
      end
    end

    def new
      @song = Song.new
    end

    def create
      @song = Song.new song_params
      if @song.save
        flash[:success] = 'Create Song Successfully!'
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
        flash[:success] = 'Song Edit Successfully!'
      else
        load_data
        render :edit
      end
    end

    def destroy
      @song.destroy
      flash[:success] = 'Song Delete Successfully!'
      redirect_to admins_songs_path
    end

    private

    def query_present?(params)
      params[:song_name].present? || params[:singer_name].present? ||
        params[:category_name].present? || params[:author_name].present?
    end

    def find_song
      @song = Song.find_by id: params[:id]
      return if @song
      flash[:danger] = 'Song not exits!'
      redirect_to admins_songs_path
    end

    def song_params
      params.require(:song).permit(
        :name, :content, :picture, :file_song,
        :author_id, :category_ids, :singer_ids, :album_ids
      )
    end

    def load_data
      @supports = Supports::Relationship.new
    end
  end
end
