class CalendarsController < ApplicationController
  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.create!(calendar_params)
    redirect_to '/users/:id'
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
     redirect_to calendar_path(@calendar)
   else
     render :edit
   end
  end

  private
  def calendar_params
    params.require(:calendar).permit(:user_id, :name)
  end

end
