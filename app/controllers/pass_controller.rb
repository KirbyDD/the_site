class PassController < ApplicationController
  def edit
    @id = params[:id]
  end

  def update
    user = User.find(params[:id])
    if params[:password] == params[:password_confirmation]
      user.update(user_params)
      user.save
      session[:user_id] = params[:id]
      redirect_to "/dashboard"
    else
      flash[:notice] = "Passwords do not match!"
      redirect_to "/password_reset/#{params[:id]}"
    end
  end

  private

  def user_params
    params.permit(:password, :password_confirmation)
  end
end
