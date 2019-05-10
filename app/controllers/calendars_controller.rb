class CalendarsController < ApplicationController
  def new
    @calendar = Calendar.new
    @user = current_user
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @user = current_user
    if @calendar.save
      flash[:notice] = "Calendar Created!"
      redirect_to @user
    else
      flash[:alert] = @calendar.errors.full_messages
      render :new
    end
  end

  def edit
    @calendar = Calendar.find(params[:id])
    @user = current_user
  end

  def update
    @calendar = Calendar.find(params[:id])
    @user = current_user
    if @calendar.update!(calendar_params)
      flash[:notice] = "Calendar Updated!"
      redirect_to @user
   else
     flash[:alert] = @calendar.errors.full_messages
     render :edit
   end
  end

  def destroy
    @user = current_user
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    flash[:notice] = "Calendar Deleted!"
    redirect_to @user
  end

  private
  def calendar_params
    params.require(:calendar).permit(:user_id, :name)
  end

end
