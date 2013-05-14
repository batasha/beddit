class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by { |p| p.created_at }.reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    @post.save!
  end

  def show
    @post = Post.find(params[:id])
  end
end