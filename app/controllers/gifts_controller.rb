class GiftsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @givers = []
    current_user.gifts.each do |gift|
      gift.givers.each do |giver|
        if !@givers.include? giver
          @givers << giver
        end
      end
    end
  end

  def create
    gift = Gift.create(gift_params)
    gift.event = current_gift_event
    if gift.valid?
      gift.user = current_user
      gift.save
      current_gift_event.gifts << gift
      current_gift_event.save
      current_user.givers.each do |giver|
        if params[:gift][:giver_ids].include? giver.id.to_s
          current_user.givers << giver
        end
      end

      redirect_to event_path(current_gift_event)
    else
      @event = Event.find(params[:event_id])
      @gift = gift
      @givers = []
      current_user.gifts.each do |gift|
        gift.givers.each do |giver|
          if !@givers.include? giver
            @givers << giver
          end
        end
      end
      render :new
    end
  end

  def edit
    @event = current_gift_event
    @gift = Gift.find(params[:id])
    @givers = []
    current_user.gifts.each do |gift|
      gift.givers.each do |giver|
        if !@givers.include? giver
          @givers << giver
        end
      end
    end
  end

  def update
    gift = Gift.find(params[:id])
    if gift.update(gift_params)
      redirect_to event_path(current_gift_event)
    else
      @event = current_gift_event
      @gift = gift
      @givers = []
      current_user.gifts.each do |gift|
        gift.givers.each do |giver|
          if !@givers.include? giver
            @givers << giver
          end
        end
      end
      render :edit
    end
  end

  def thank
    gift_ids = params[:event][:gift_ids]
    @event = Event.find(params[:event_id])
    @event.gifts.all.each do |gift|
      if gift_ids.include? gift.id.to_s
        gift.thanked = 1
      else
        gift.thanked = 0
      end
      gift.save
    end

    redirect_to event_path(current_gift_event)
  end

  def destroy
    gift = Gift.find(params[:id])
    gift.destroy
    redirect_to event_path(current_gift_event)
  end

private

  def gift_params
    params.require(:gift).permit(:name, giver_ids:[], givers_attributes: [:name])
  end

end
