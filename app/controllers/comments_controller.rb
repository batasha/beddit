class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.save!

    redirect_to post_url(@comment.post)
  end

  def show
    @comment = Comment.find(params[:id])
  end
end