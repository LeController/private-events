class AttendancesController < ApplicationController
  def new
    # @attendance = Attendance.new
  end

  def create

    @event = Event.find(params[:event_id])


    attendance = Attendance.new(attended_event_id: @event.id, attendee_id: current_user.id)

    if attendance.save
      flash[:notice] = "Your attendance has been noted!"
      redirect_to @event
    else
      flash[:error] = "You are already attending this event."
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:id])
    puts "EVENT:", @event

    @attendance = Attendance.find_by(attended_event: params[:id], attendee_id: current_user.id)
    @attendance.destroy

    redirect_to @event
  end
end
