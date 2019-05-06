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
    @afterthought = Afterthought.new
    @events = @user.events
  end

  def create
    @user = current_user
    @events = @user.events
    @afterthought = Afterthought.create(afterthought_params)

    if @afterthought.valid?
      redirect_to @afterthought
    else
      render :new
    end



  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def afterthought_params
    params.require(:afterthought).permit(:actual_location,:actual_start,:actual_end,:actual_description,:thoughts,:rating,:event_id)
  end

end
