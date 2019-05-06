class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      # redirect_to '/profile'
    else
      redirect_to new_session_path
      redirect_to '/login'
    end
  end

  def destroy
    # session[:user_id] = nil
    session.delete(:user)
    redirect_to root_url, notice:"Logged out!"
  end




end
