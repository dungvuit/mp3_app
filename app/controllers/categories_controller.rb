class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:albums, albums: :songs)
  end

  def show
    @category = Category.includes(:albums, albums: :songs)
                        .find_by id: params[:id]
    @albums = Album.all
  end
end
