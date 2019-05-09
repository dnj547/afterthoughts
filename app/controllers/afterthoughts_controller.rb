class AfterthoughtsController < ApplicationController

  def index
    @user = current_user
    @user_afterthoughts = @user.afterthoughts
  end


  def show
    @user = current_user
    @events = @user.events
    @afterthought = Afterthought.find(params[:id])
  end

  def new
    @user = current_user
    @events = @user.events
    @event = Event.find(params[:event_id])
    @event_attendees = @event.attendees
    @afterthought_attendee = AfterthoughtAttendee.new
    @afterthought = Afterthought.new


  end

  def create
    @user = current_user
    @events = @user.events

    @afterthought = Afterthought.create(afterthought_params)

    @event = @afterthought.event
    @event_attendees = @event.attendees
  
    ## if attendee is selected, create afterthought_attendee

    @afterthought_attendees_ids = params[:attendee_id]
    @afterthought_attendees = create_many_afterthought_attendees(@afterthought,@afterthought_attendees_ids)

    # @event_attendees =
    # @afterthought_attendee = AfterthoughtAttendee.create(afterthought: @afterthought, attendee: )

    if @afterthought.valid?
      redirect_to @afterthought
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @events = @user.events
    @afterthought = Afterthought.find(params[:id])
  end

  def update
    @user = current_user
    @afterthought = Afterthought.find(params[:id])
    @afterthought.update(afterthought_params)

    if @afterthought.valid?
      redirect_to @afterthought
    else
      render :edit
    end

  end

  def destroy
    @user = current_user

    @afterthought = Afterthought.find(params[:id])
    @event = @afterthought.event
    @afterthought.destroy
    flash[:message] = "Afterthought Deleted"
    #we will need to change the redirect: using '@user' just to verify it works
    redirect_to @event
  end

  private
  def afterthought_params
    params.require(:afterthought).permit(:actual_location,:actual_start,:actual_end,:actual_description,:thoughts,:rating,:event_id)
  end

end
