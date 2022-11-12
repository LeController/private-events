class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  # GET /posts/new
  def new
    @event = Event.new
  end

  # POST /posts
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event Successfully Saved"
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :body, :date, :location)
    end

end
