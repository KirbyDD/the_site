class RemindersController < ApplicationController
  def new; end

  def create
    current_user.reminders.create(reminder_params)
    redirect_to "/dashboard"
  end

  def index
    @reminders = current_user.reminders
  end

  private

  def reminder_params
    params.permit(:title, :message, :link, :episode, :chapter)
  end
end
