class GiftsController < ApplicationController
  layout false, only: [:new, :show, :edit]

  def index
  end

  def new
    @event = current_gift_event
    @givers = current_user_givers
  end

  def create
    @gift = Gift.create(gift_params)
    @gift.event = current_gift_event
    if @gift.valid?
      @gift.user = current_user
      @gift.save
      current_gift_event.gifts << @gift
      current_gift_event.save
      current_user.givers.each do |giver|
        if params[:gift][:giver_ids].include? giver.id.to_s
          current_user.givers << giver
        end
      end

      render json: @gift, status: 201
    else
      @event = current_gift_event
      @givers = current_user_givers
      render :new
    end
  end

  def edit
    @event = current_gift_event
    @gift = Gift.find(params[:id])
    @givers = current_user_givers
  end

  def update
    @gift = Gift.find(params[:id])
    if @gift.update(gift_params)
      render json: @gift, status: 204
    else
      @event = current_gift_event
      @givers = current_user_givers
      render :edit
    end
  end

  def thank
    gift_ids = params[:event][:gift_ids]
    @event = current_gift_event
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
  end

private

  def gift_params
    params.require(:gift).permit(:name, giver_ids:[], givers_attributes: [:name])
  end

end
