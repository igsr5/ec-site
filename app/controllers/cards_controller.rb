class CardsController < ApplicationController
  def create

  end

  def update
    @id = params[:card][:id]
    @card = Card.new(card_param)
    if @card.save!
      Card.find(@id).update!(user_id: nil)
    end
  end

  def destroy

  end

  private

  def card_param
    params.require(:card).permit(:name, :card_num, :expiration_date, :security_code,:user_id)
  end

end
