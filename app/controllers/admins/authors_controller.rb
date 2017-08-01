class Admins::AuthorsController < ApplicationController
  layout "application_admin"

  before_action :find_author, except: %i[index new create]

  def index
    @authors = Author.sort_by_create_at.paginate page: params[:page]
    respond_to do |format|
      format.html
      format.xls {send_data @authors.to_csv(col_sep: "\t")}
    end
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = "Create Author Successfully!"
      redirect_to admins_authors_path
    else
      render :new
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
