class CommentsController < ApplicationController

  def create
    if user_signed_in?
      @song = Song.find_by id: params[:song_id]
      @comment = @song.comments.create!(user_id: current_user.id, content: params[:content])
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @song = Song.find_by id: params[:song_id]
    @comment = Comment.find_by(id: params[:id], user_id: current_user.id).destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
    @song = Song.find_by id: params[:song_id]
    @comment = Comment.find_by id: params[:id]
  end

  def update
    @comment = Comment.find_by id: params[:id]
    @comment.update_attributes comment_params
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
