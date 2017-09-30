class GiftsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    gift = Gift.create(gift_params)
    giver_params.each do |id|
      gift.givers << Giver.find(id)
    end
    @event.gifts << gift.save

    redirect_to event_path(@event)
  end


private

  def gift_params
    params.require(:gift).permit(:name)
  end

  def giver_params
    params.require(:gift).permit(:giver_ids)
  end

end
