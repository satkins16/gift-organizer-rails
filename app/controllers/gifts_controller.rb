class GiftsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    gift = Gift.create(gift_params)
    gift.user = current_user
    gift.save
    current_gift_event.gifts << gift
    current_gift_event.save

    redirect_to event_path(current_gift_event)
  end

  def edit
    @event = current_gift_event
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(gift_params)
    redirect_to event_path(current_gift_event)
  end

  def destroy
    gift = Gift.find(params[:id])
    gift.destroy
    redirect_to event_path(current_gift_event)
  end

  def thank
    Gift.where(id: params[:gift_id]).update_all(thanked: 1)
    redirect_to event_path(current_gift_event)
  end


private

  def gift_params
    params.require(:gift).permit(:name, giver_ids:[], givers_attributes: [:name])
  end

end
