class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by { |p| p.created_at }.reverse
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
    @post.comments.build
  end
end