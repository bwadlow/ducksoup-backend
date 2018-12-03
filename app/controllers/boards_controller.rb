class BoardsController < ApplicationController

  def index
    render json: Board.all
  end

  def show
    @board = Board.find_by(id: params[:id])
    render json: @board
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create(board_params)
    if @board.valid?
      redirect_to(@board)
    else
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
    render :edit
  end

  def update
    if @board.update
      redirect_to(@board)
    else
      render :edit
    end
  end



  private

  def board_params
    params.require(:board).permit(:id, :name, :background)
  end

end
