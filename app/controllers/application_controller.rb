class ApplicationController < ActionController::Base
  helper_method :current_user, :log_in, :current_user?, :logged_in?, :create_many_afterthought_attendees


  def create_many_afterthought_attendees(afterthought,attendees_ids)
  
    new_attendees_ids =  attendees_ids.reject { |id| id.empty? }
    new_attendees_ids.each do |attendee_id|
      AfterthoughtAttendee.create(attendee_id: attendee_id,afterthought_id: afterthought.id)
    end
  end

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
