class Admins::CategoriesController < ApplicationController
  layout "application_admin"

  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = if params[:search].present?
      Category.search_by_name(params[:search])
    else
      Category
    end.sort_by_create_at.paginate page: params[:page]
    respond_to do |format|
      format.html
      format.js
      format.xls {send_data @categories.to_csv(col_sep: "\t")}
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Create Category Successfully!"
      redirect_to admins_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      redirect_to admins_categories_path
      flash[:success] = "Category Edit Successfully!"
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Category Delete Successfully!"
    else
      flash[:danger] = "Can't delete category"
    end
    redirect_to admins_categories_path
  end

  private
  def find_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = "Category not exist"
      redirect_to admins_categories_path
    end
  end

  def category_params
    params.require(:category).permit :name
  end
end