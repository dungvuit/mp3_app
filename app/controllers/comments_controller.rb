class CommentsController < ApplicationController

  before_action :find_song, only: %i[create destroy update]

  def create
    return unless user_signed_in?
    @comment = @song.comments.create!(user_id: current_user.id,
      content: params[:content], parent_id: params[:parent_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id],
      user_id: current_user.id).destroy
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment = @song.comments.find_by id: params[:id]
    @comment.update_attributes content: params[:content]
  end

  private

  def find_song
    @song = Song.find_by id: params[:song_id]
  end
end
