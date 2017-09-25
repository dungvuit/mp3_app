module Admins
  class UsersController < ApplicationController
    layout 'application_admin'

    before_action :check_user_logged, :verify_admin
    before_action :find_user, except: %i[index new create]

    def index
      @users = User.index_users params
      respond_to do |format|
        format.html
        format.js
        format.xls { send_data @users.to_csv(col_sep: "\t") }
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params
      if @user.save
        flash[:success] = 'Create User Successfully!'
        redirect_to admins_users_path
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @user.update_attributes user_params
        redirect_to admins_users_path
        flash[:success] = 'User Edit Successfully!'
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      flash[:success] = 'User Delete Successfully!'
      redirect_to admins_users_path
    end

    private

    def find_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = 'User not exits!'
      redirect_to admins_users_path
    end

    def user_params
      params.require(:user).permit(
        :name, :email, :password,
        :password_confirmation,
        :address, :phonenumber,
        :is_admin,
        :image
      )
    end
  end
end
