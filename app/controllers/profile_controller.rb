class ProfileController < ApplicationController
  def new; end

  def create
    Profile.create!(profile_params)
    redirect_to '/dashboard'
  end

  private

  def profile_params
    params.permit(:first_name, :last_name, :age, :location, :user_id)
  end
end
