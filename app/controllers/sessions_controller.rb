class SessionsController < ApplicationController
  def create
    if login(params[:user][:username], params[:user][:password])
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  def new
  end
end