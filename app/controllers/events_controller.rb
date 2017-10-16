class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
    event = Event.create(event_params)
    if event.save
      event.user = current_user
      event.save
      redirect_to event_path(event)
    else
      @event = event
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to event_path(event)
    else
      @event = event
      render :edit
    end
  end

  def thank
    Gift.all.each do |gift|
      if params[:event][:gift_ids].map(&:to_i).include? gift.id
        gift.thanked = 1
      else
        gift.thanked = 0
      end
    end
    redirect_to event_path(current_gift_event)
  end


  private

  def event_params
    params.require(:event).permit(:name, :date, :gift_ids => [])
  end

end
