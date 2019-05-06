class EventsController < ApplicationController

  def new

    @user = current_user
    @event = Event.new
    @user_calendars = @user.calendars

  end

  def create
    @user = current_user
    @event = Event.create(event_params)
    redirect_to @user
  end


  private
  def event_params
    params.require(:event).permit(:calendar_id,:visibility,:organizer,:title,:description,:start,:end,:location,:afterthought_id)
  end

end
