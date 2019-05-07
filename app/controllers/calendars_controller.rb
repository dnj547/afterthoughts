class CalendarsController < ApplicationController
  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.create!(calendar_params)
    flash[:message] = "Calendar Successfully Created!"
    redirect_to '/users/:id'
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      flash[:message] = "Calendar Successfully Updated!"
     redirect_to calendar_path(@calendar)
   else
     flash[:message] = @calendar.errors.full_messages
     render :edit
   end
  end

  def destroy
    @user = current_user
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    flash[:message] = "Calendar Successfully Deleted!"
    redirect_to @user
  end

  private
  def calendar_params
    params.require(:calendar).permit(:user_id, :name)
  end

end
