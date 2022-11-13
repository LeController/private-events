class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show

    puts params

    @event = Event.find(params[:id])
    @attendance = Attendance.new
  end

  # GET /posts/new
  def new
    @event = Event.new
  end

  # POST /posts
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event Successfully Saved!"
      redirect_to @event
    else
      flash.now[:error] = "Unable to create event!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:success] = "Event successfully edited!"
      redirect_to @event
    else
      flash.now[:error] = "Unable to edit event!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :body, :date, :location)
    end

end
