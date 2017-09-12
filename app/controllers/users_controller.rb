class UsersController < ApplicationController
  def index
    @favorites = Favorite.all
  end
end
