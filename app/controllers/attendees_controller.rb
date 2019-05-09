class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new
    @event = Event.last
  end

  def create
    @user = current_user
    @event = Event.last
    @attendee = Attendee.create(attendee_params)
    @event_attendee = EventAttendee.create(event: @event, attendee: @attendee)
    if @attendee.valid?
      flash[:notice] = "Attendee Created"
      if @event.attendees
        redirect_to new_attendee_path
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
    # byebug

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
