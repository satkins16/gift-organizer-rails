class EventsController < ApplicationController
  layout false, only: [:edit, :new]

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

  def show #=> url-here/1,json
    @event = current_event
    @gifts = @event.gifts
    if @event.user != current_user
      redirect_to events_path
    end
    respond_to do |format|
      format.html {render :show}
      format.json { render json: @gifts.to_json(only: [:name, :id], include: [givers: { only: [:name]}]) }
    end
  end

  def gifts_json
    event = Event.find(params[:id])
    gifts = event.gifts
    render json: GiftSerializer.serialize(gifts)
  end

  def edit
    @event = current_event
  end

  def update
    @event = current_event
    if @event.update(event_params)
      render json: @event, status: 201
    else
      render :edit
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :date, :gift_ids => [])
  end

end
