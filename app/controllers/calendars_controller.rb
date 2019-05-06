class CalendarsController < ApplicationController
  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.create!(calendar_params)
    redirect_to '/users/:id'
  end

  private
  def calendar_params
    params.require(:calendar).permit(:user_id, :name)
  end

end
