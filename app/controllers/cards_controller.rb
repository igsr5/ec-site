class CardsController < ApplicationController
  def create
    @card = Card.new(card_param)
    unless @card.save
      render :errors
    end
  end

  def update
    @id = params[:card][:id]
    @card = Card.new(card_param)
    if @card.save
      Card.find(@id).update!(user_id: nil)
    else
      render :errors
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.update!(user_id: nil)
  end

  private

  def card_param
    params.require(:card).permit(:name, :card_num, :expiration_date, :security_code, :user_id)
  end

end
