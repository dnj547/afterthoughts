class CalendarsController < ApplicationController
  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.create!(calendar_params)
    @user = User.find(params[:calendar][:user_id])
    flash[:notice] = "Calendar Successfully Created!"
    redirect_to @user
  end

  def edit
    @calendar = Calendar.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      flash[:notice] = "Calendar Successfully Updated!"
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
    flash[:notice] = "Calendar Successfully Deleted!"
    redirect_to @user
  end

  private
  def calendar_params
    params.require(:calendar).permit(:user_id, :name)
  end

end
