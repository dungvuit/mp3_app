module Admins
  class CategoriesController < ApplicationController
    layout 'application_admin'

    before_action :check_user_logged, :verify_admin
    before_action :find_category, except: %i[index new create]

    def index
      @categories = Category.index_categories params
      @category = Category.new
      respond_to do |format|
        format.html
        format.js
        format.xls { send_data Category.to_csv(col_sep: "\t") }
      end
    end

    def create
      @category = Category.new category_params
      if @category.save
        flash[:success] = 'Create Category Successfully!'
        redirect_to admins_categories_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @category.update_attributes category_params
        redirect_to admins_categories_path
        flash[:success] = 'Category Edit Successfully!'
      else
        render :edit
      end
    end

    def destroy
      if @category.destroy
        flash[:success] = 'Category Delete Successfully!'
      else
        flash[:danger] = 'Cant delete category'
      end
      redirect_to admins_categories_path
    end

    private

    def find_category
      @category = Category.find_by id: params[:id]
      return if @category
      flash[:danger] = 'Category not exist'
      redirect_to admins_categories_path
    end

    def category_params
      params.require(:category).permit :name
    end
  end
end
