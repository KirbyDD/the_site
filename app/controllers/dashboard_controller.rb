class DashboardController < ApplicationController
  def show
    unless current_user
      flash[:notice] = 'You Are Not Logged In.'
      redirect_to '/'
    end
  end
end
