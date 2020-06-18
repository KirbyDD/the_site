class SessionsController < ApplicationController
  def new
    if current_user
      flash[:notice] = 'You are already logged in!'
      redirect_to "/dashboard"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login Successful"
      redirect_to "/dashboard"
    else
      flash[:notice] = "Invalid Email and/or Password"
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:cart)
    flash[:notice] = 'You have logged out'
    redirect_to "/"
  end

end
