class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.save!

    CommentAncestry.create_ancestry(@comment.parent, @comment)

    redirect_to post_url(@comment.post)
  end

  def show
    @comment = Comment.find(params[:id])
    @child = @comment.children.build
    @replies = CommentAncestry.where(:ancestor_id => @comment.id).includes(:descendant).all
  end
end