class CommentsController < ApplicationController

  def create
    if user_signed_in?
      @song = Song.find_by id: params[:song_id]
      @comment = @song.comments.create!(user_id: current_user.id,
        content: params[:content], parent_id: params[:parent_id])
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @song = Song.find_by id: params[:song_id]
    @comment = Comment.find_by(id: params[:id],
      user_id: current_user.id).destroy
    respond_to do |format|
      format.js
    end
  end

  def update
    @song = Song.find_by id: params[:song_id]
    @comment = @song.comments.find_by id: params[:id]
    @comment.update_attributes content: params[:content]
  end
end
