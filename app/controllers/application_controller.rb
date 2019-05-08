class ApplicationController < ActionController::Base
  helper_method :current_user, :log_in, :current_user?


  def current_user?(user)
    user == current_user
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def welcome
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    # else
      # @current_user = nil
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized?
    redirect_to login_path unless logged_in?
  end

end
