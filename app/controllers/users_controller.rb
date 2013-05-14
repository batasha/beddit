class UsersController < ApplicationController

  def new
    @user = User.new
    3.times { @user.emails.build }
  end

  def create
    @user = User.new(params[:user])

    @user.save!
    redirect_to user_url(@user)
  end

  def show
    @user = User.find(params[:id])
  end
end