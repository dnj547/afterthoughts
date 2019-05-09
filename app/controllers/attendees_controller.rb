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
    @attendee = Attendee.create(attendee_params)
    @event_attendee = EventAttendee.create(event: @event, attendee: @attendee)
    if @attendee.valid?
      flash[:notice] = "Attendee Created"
      if @event.attendees
          redirect_to "/events/attendees/new/#{@event.id}"
      else
      redirect_to @event
      end
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
    @attendee = Attendee.create(actual_params)
    @afterthought_attendee = AfterthoughtAttendee.create(afterthought:@afterthought,attendee:@attendee)
    if @attendee.valid?
      flash[:notice] = "Attendee Created"

      if @afterthought.attendees
        redirect_to "/afterthoughts/attendees/new/#{@afterthought.id}"
      else
        redirect_to  @afterthought
      end
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
