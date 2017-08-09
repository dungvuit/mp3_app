class Admins::UsersController < ApplicationController
  layout "application_admin"

  before_action :check_user_logged, :verify_admin
  before_action :find_user, except: [:index, :new, :create]

  def index
    @users = if params[:search].present? && params[:search_by_permision].present?
      User.search_by_name(params[:search])
        .search_by_permision(params[:search_by_permision])
    elsif params[:search].present?
      User.search_by_name(params[:search])
    elsif params[:search_by_permision].present?
      User.search_by_permision(params[:search_by_permision])
    else
      User
    end.sort_by_create_at
    respond_to do |format|
      format.html
      format.js
      format.xls {send_data @users.to_csv(col_sep: "\t")}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Create User Successfully!"
      redirect_to admins_users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to admins_users_path
      flash[:success] = "User Edit Successfully!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User Delete Successfully!"
    redirect_to admins_users_path
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = "User not exits!"
      redirect_to admins_users_path
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :address, :phonenumber, :is_admin, :image
  end
end
