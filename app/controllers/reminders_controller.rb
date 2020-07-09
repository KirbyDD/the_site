class RemindersController < ApplicationController
  def new; end

  def create
    current_user.reminders.create(reminder_params)
    redirect_to "/dashboard"
  end

  def index
    @reminders = current_user.reminders
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def update
    reminder = Reminder.find(params[:id])
    reminder.update(reminder_params)
    reminder.save
    redirect_to "/reminders/#{params[:id]}"
  end

  def destroy
    Reminder.delete(params[:id])
    redirect_to "/reminders"
  end
  
  private

  def reminder_params
    params.permit(:title, :message, :link, :episode, :chapter)
  end
end
