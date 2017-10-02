class GiftsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    gift = Gift.create(gift_params)
    gift.user = current_user
    gift.save
    @event.gifts << gift
    @event.save

    redirect_to event_path(@event)
  end


private

  def gift_params
    params.require(:gift).permit(:name, giver_ids:[], givers_attributes: [:name])
  end

end
