class UsersController < ApplicationController
  def new; end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are registered and now logged in."
      redirect_to "/dashboard"
    elsif @user.duplicate_email?(@user.email)
      flash[:notice] = "Email is already in use, please try another."
      render :new
    else
      flash[:notice] = "Please fill out all required fields."
      render :new
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
