class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
    event = Event.create(event_params)
    event.user = current_user
    event.save
    redirect_to event_path(event)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    Gift.all.each do |gift|
      if params[:event][:gift_ids].include 
    redirect_to event_path(event)
  end


  private

  def event_params
    params.require(:event).permit(:name, :date)
  end

end
