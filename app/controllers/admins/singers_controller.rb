module Admins
  class SingersController < ApplicationController
    layout 'application_admin'

    before_action :check_user_logged, :verify_admin
    before_action :find_singer, except: %i[index new create]
    before_action :load_singer_genders, only: %i[new edit]

    def index
      @singers = Singer.index_singers params
      respond_to do |format|
        format.html
        format.js
        format.xls { send_data @singers.to_csv(col_sep: "\t") }
      end
    end

    def new
      @singer = Singer.new
    end

    def create
      @singer = Singer.new singer_params
      if @singer.save
        flash[:success] = 'Create Singer Successfully!'
        redirect_to admins_singers_path
      else
        load_singer_genders
        render :new
      end
    end

    def edit; end

    def update
      if @singer.update_attributes singer_params
        redirect_to admins_singers_path
        flash[:success] = 'Singer Edit Successfully!'
      else
        load_singer_genders
        render :edit
      end
    end

    def destroy
      @singer.destroy
      flash[:success] = 'Singer Delete Successfully!'
      redirect_to admins_singers_path
    end

    private

    def find_singer
      @singer = Singer.find_by id: params[:id]
      return if @singer
      flash[:danger] = 'Singer not exits!'
      redirect_to admins_singers_path
    end

    def singer_params
      params.require(:singer).permit(
        :name, :picture, :date_of_birth, :gender, :address
      )
    end

    def load_singer_genders
      @gender = Singer.genders.keys
    end
  end
end
