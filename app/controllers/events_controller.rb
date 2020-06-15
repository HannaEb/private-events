class EventsController < ApplicationController

  def index
    @upcoming_events = Event.future_events.all
    @past_events = Event.previous_events.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    @event.save
    redirect_to user_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :start_time, :finish_time, :creator_id )
  end
end
