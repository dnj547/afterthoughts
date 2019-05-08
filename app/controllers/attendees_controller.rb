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
      flash[:message] = "Event Created"
      redirect_to @event
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name, :notes)
  end

end
