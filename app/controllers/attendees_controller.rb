class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new
    @event = Event.find(params[:id])
    # if params.has_key?(:id)
    #   @event = Event.find(params[:id])
    # elsif params.has_key?(:event_id)
    #   @event = Event.find(params[:event_id])
    # end
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
  end

  def actual_create
    @user = current_user
  end


  private

  def attendee_params
    params.require(:attendee).permit(:name, :notes)
  end

end
