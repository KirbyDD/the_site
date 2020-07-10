class RemindersController < ApplicationController
  def new; end

  def create
    current_user.reminders.create(reminder_params)
    redirect_to "/dashboard"
  end

  def index
    if current_user
      @reminders = current_user.reminders.order(:title)
    else
      flash[:notice] = 'You Are Not Logged In.'
      redirect_to '/'
    end
  end

  def show
    if current_user
      @reminder = Reminder.find(params[:id])
    else
      flash[:notice] = 'You Are Not Logged In.'
      redirect_to '/'
    end
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
