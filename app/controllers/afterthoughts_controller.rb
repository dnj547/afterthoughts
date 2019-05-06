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
    @user = current_user
    @afterthought = Afterthought.find(params[:id])
    @events = @user.events
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
    @afterthought.destroy
    redirect_to @user
  end

  private
  def afterthought_params
    params.require(:afterthought).permit(:actual_location,:actual_start,:actual_end,:actual_description,:thoughts,:rating,:event_id)
  end

end
