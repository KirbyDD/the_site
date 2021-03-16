class Admin::BoardController < Admin::BaseController
  def new; end

  def create
    Board.create(board_params)
    flash[:notice] = 'Board Created!'
    redirect_to "/admin"
  end

  def destroy
    Board.destroy(abbre: params[:abbre])
    flash[:notice] = 'Board Deleted!'
    redirect_to "/admin"
  end

  private

  def board_params
    params.permit(:name, :abbre)
  end
end
