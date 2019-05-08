class EventsController < ApplicationController

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  def new
    @user = current_user
    @event = Event.new
    @user_calendars = @user.calendars
    @attendee = Attendee.new
  end

  def create
    @user = current_user
    @user_calendars = @user.calendars
    @attendee = Attendee.create()
    @event = Event.create(event_params)
    if @event.valid?
      flash[:message] = "Event Created"
      redirect_to @user
    else
      flash[:message] = @event.errors.full_messages
    end
  end

  def edit
    @user = current_user
    @user_calendars = @user.calendars
    @event = Event.find(params[:id])
  end

  def update
    @user = current_user
    @user_calendars = @user.calendars
    @event = Event.find(params[:id])
    @event.update(event_params)

    if @event.valid?
      flash[:message] = "Event Updated!"
      redirect_to @event
    else
      flash[:message] = @event.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = current_user
    @event = Event.find(params[:id])
    @event.destroy
    flash[:message] = "Event Deleted!"
    redirect_to @user
  end

  private
  def event_params
    params.require(:event).permit(:calendar_id,:visibility,:organizer,:title,:description,:start,:end,:location,:afterthought_id)
  end



end
