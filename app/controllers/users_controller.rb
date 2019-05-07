class UsersController < ApplicationController

  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  def show
    # byebug
    @user = current_user
    @calendars = @user.calendars
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      log_in @user
      flash[:success] = "Welcome to Afterthoughts!"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:password,:password_confirmation)
  end
end
