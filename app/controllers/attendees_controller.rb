class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new
    @event = Event.find(params[:id])
  end

  def create
    @user = current_user
    if params.has_key?(:id)
      @event = Event.find(params[:id])
    elsif params.has_key?(:event_id)
      @event = Event.find(params[:event_id])
    end
    @attendee = Attendee.new(attendee_params)
    if @attendee.valid?
      flash[:notice] = "Attendee Added!"
      @event_attendee = EventAttendee.create(event: @event, attendee: @attendee)
      if @event.attendees
        redirect_to "/events/attendees/new/#{@event.id}"
      else
      redirect_to @event
      end
    else
      flash[:alert] = @attendee.errors.full_messages
      render :new
    end
  end

  def actual_new
    @user = current_user
    @attendee = Attendee.new
    @afterthought = Afterthought.find(params[:id])
    @event = @afterthought.event
  end

  def actual_create
    @user = current_user
    @afterthought = Afterthought.find(params[:id])
    @event = @afterthought.event
    @attendee = Attendee.new(actual_params)
    if @attendee.valid?
      flash[:notice] = "Attendee Added!"
      @afterthought_attendee = AfterthoughtAttendee.create(afterthought:@afterthought,attendee:@attendee)
      if @afterthought.attendees
        redirect_to "/afterthoughts/attendees/new/#{@afterthought.id}"
      else
        redirect_to  @afterthought
      end
    else
      flash[:alert] = @attendee.errors.full_messages
      render :new
    end
  end


  private

  def attendee_params
    params.require(:attendee).permit(:name, :notes)
  end

  def actual_params
    params.require(:"/afterthoughts/attendees").permit(:name,:notes)
  end

end
