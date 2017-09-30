class GiftsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    gift = Gift.create(gift_params)
    

  end


private

  def gift_params
    params.require(:gift).permit(:name)
  end

end
