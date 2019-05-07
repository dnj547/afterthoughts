class UsersController < ApplicationController

  def show
    @user = current_user
    @calendars = @user.calendars
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
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
