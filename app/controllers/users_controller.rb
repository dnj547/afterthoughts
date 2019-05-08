class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user,   only: [:show]

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

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
