class AttendancesController < ApplicationController
  def new
    # @attendance = Attendance.new
  end

  def create
    event = Event.find(params[:event_id])
    attendance = Attendance.new(attended_event_id: event.id, attendee_id: current_user.id)

    if attendance.save
      flash[:notice] = "Your attendance has been noted!"
      redirect_to event
    else
      flash[:error] = "Event cannot be attended."
    end
  end
end
