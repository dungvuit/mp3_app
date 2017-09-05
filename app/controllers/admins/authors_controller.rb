class Admins::AuthorsController < ApplicationController
  layout "application_admin"

  before_action :check_user_logged, :verify_admin
  before_action :find_author, except: %i[index new create]

  def index
    @authors = if params[:search].present?
      Author.search_by_name(params[:search])
    else
      Author
    end.sort_by_create_at
    @author = Author.new
    respond_to do |format|
      format.html
      format.js
      format.xls {send_data @authors.to_csv(col_sep: "\t")}
    end
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = "Create Author Successfully!"
      redirect_to admins_authors_path
    end
  end

  def edit; end

  def update
    if @author.update_attributes author_params
      redirect_to admins_authors_path
      flash[:success] = "Author Edit Successfully!"
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    flash[:success] = "Author Delete Successfully!"
    redirect_to admins_authors_path
  end

  private

  def find_author
    @author = Author.find_by id: params[:id]
    unless @author
      flash[:danger] = "Author not exits!"
      redirect_to admins_authors_path
    end
  end

  def author_params
    params.require(:author).permit :name
  end
end
