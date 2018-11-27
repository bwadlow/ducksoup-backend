class UserBoardsController < ApplicationController

  def index
    render json: UserBoard.all
  end


  def show
    @user_board = UserBoard.find_by(id: params[:id])
    render json: @user_board
  end

  def new
    @user_board = UserBoard.new
  end

  def create
    @user_board = UserBoard.create(user_board_params)
    if @user_board.valid
      redirect_to(@user_board)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @user_board.update
      redirect_to(@user_board)
    else
      render :edit
    end
  end



  private

  def user_board_params
    params.require(:user_board).permit(:user_id, :board_id)
  end

end
