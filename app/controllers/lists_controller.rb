class ListsController < ApplicationController

  def index
    render json: List.all
  end

  def show
    @list = List.find_by(id: params[:id])
    render json: @list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.valid?
      redirect_to(@list)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @list.update
      redirect_to(@list)
    else
      render :edit
      end
  end



  private

  def list_params
    params.require(:list).permit(:title, :position, :board_id)
  end

end
