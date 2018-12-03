class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update]

  def index
    render json: Card.all
  end

  def show
    @card = Card.find_by(id: params[:id])
    render json: @card
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    if @card.valid?
      redirect_to(@card)
    else
      render :new
    end
  end


  def update
    @card.update(card_params)
    render :json => :@card
  end



  private

  def card_params
    params.require(:card).permit(:id, :title, :description, :comment, :list_id, :position)
  end

  def set_card
    @card = Card.find(params[:id])
  end

end
