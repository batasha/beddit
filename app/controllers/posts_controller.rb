class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by { |p| p.recent_upvotes }.reverse
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    @post.save!
    redirect_to root_url
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def update
    @post = Post.find(params[:id])
    redirect_to post_url(@post)
  end

end