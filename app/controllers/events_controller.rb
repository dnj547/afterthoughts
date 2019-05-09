class EventsController < ApplicationController

  def show
    @user = current_user
    if Event.exists?(params[:id])
      @event = Event.find(params[:id])
    else
      redirect_to @user
    end
  end

  def new
    @user = current_user
    @event = Event.new
    @event.start = DateTime.new(params[:year].to_i,params[:month].to_i,params[:day].to_i)
    @event.end = DateTime.new(params[:year].to_i,params[:month].to_i,params[:day].to_i)
    @user_calendars = @user.calendars
    @attendee = Attendee.new
  end

  def create
    @user = current_user
    @user_calendars = @user.calendars
    @event = Event.create(event_params)
    if @event.valid?
      flash[:notice] = "Event Created"
      redirect_to new_attendee_path
    else
      flash[:alert] = @event.errors.full_messages
      render :new
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
      flash[:notice] = "Event Updated!"
      redirect_to @event
    else
      flash[:alert] = @event.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = current_user
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event Deleted!"
    redirect_to @user
  end

  private
  def event_params
    params.require(:event).permit(:calendar_id,:visibility,:organizer,:title,:description,:start,:end,:location,:afterthought_id)
  end

end
