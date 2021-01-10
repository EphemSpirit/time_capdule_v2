class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show]

  def index
    @meetings = current_user.meetings
  end

  def new
    @meeting = current_user.meetings.build
  end

  def create
    @meeting = current_user.meetings.build(meeting_params)

    if @meeting.save
      flash[:notice] = "Event created!"
      redirect_to my_calendar_path
    else
      flash[:notice] = "Event not saved"
      redner :new
    end
  end

  def show
  end

  private

   def meeting_params
     params.require(:meeting).permit(:title, :start_date, :description)
   end

   def find_meeting
     @meeting = Meeting.find(params[:format])
   end

end
