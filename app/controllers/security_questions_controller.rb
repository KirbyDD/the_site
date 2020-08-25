class SecurityQuestionsController < ApplicationController
  def new; end

  def create
    SecurityQuestion.create!(security_questions_params)
    redirect_to '/dashboard'
  end

  def show
    user = User.find_by(email: params[:email])
    if user && user.security_question
      @security_question = user.security_question
    else
      flash[:notice] = 'Account does not exist or does not have a security question.'
      redirect_to '/dashboard'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def security_questions_params
    params.permit(:question, :answer, :user_id)
  end
end
