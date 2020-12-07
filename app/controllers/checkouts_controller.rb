class CheckoutsController < ApplicationController
  layout 'checkouts'
  before_action :is_cart

  def address_form_show
    @address = Address.new
    @cart = Cart.find(session[:cart_id])
    render :address_form
  end

  def address_set_session
    @address=Address.new(address_param)
    if @address.valid?
      session[:address] = address_param
      redirect_to :checkouts_card
    else
      redirect_to :checkouts_address
    end
  end

  def card_form_show
    @card = Card.new
    @cart = Cart.find(session[:cart_id])
    render :card_form
  end

  def card_set_session
    @card=Card.new(card_param)
    if @card.valid?
      session[:card] = card_param
      redirect_to :checkouts_confirm
    else
      redirect_to :checkouts_card
    end
  end

  def confirm
    @cart = Cart.find(session[:cart_id])
  end

  def issue_receipt
  end

  def completion_show
  end

  private

  def is_cart
    cart = Cart.find(session[:cart_id])
    if cart.is_cart_empty
      redirect_to carts_path
    end
  end

  def address_param
    params.require(:address).permit(:postal_code, :prefecture, :city, :address1, :address2, :family_name, :given_name, :email)
  end

  def card_param
    params.require(:card).permit(:name, :card_num, :expiration_date, :security_code)
  end
end
