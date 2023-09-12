class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy]

  def index
    # Scope your query to the dates being shown:
    # start_date = params.fetch(:start_date, Date.today).to_date

    @meetings = Meeting.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
      # starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def show
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user.id
    if @meeting.save
      redirect_to meetings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path, status: :see_other
  end

  def edit
  end

  def update
    @meeting.update(meeting_params)
    @meeting.user_id = current_user.id
    if @meeting.save
      redirect_to meetings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

private

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :description)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
