class CheckoutsController < ApplicationController
  before_action :is_cart, except: [:completed]
  before_action :has_address_session, only: [:card_form_show, :confirm]
  before_action :has_card_session, only: [:confirm]
  before_action :has_receipt_session, only: [:completed]

  def address_form_show
    @address = if session[:address]
      Address.new(session[:address])
    else
      Address.new
    end
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
    render :address_form
  end

  def address_set_session
    @address = Address.new(address_param)
    if @address.valid?
      session[:address] = address_param
      redirect_to :checkouts_card
    else
      @cart = Cart.find(session[:cart_id])
      @order_details = @cart.order_details
      render :address_form
    end
  end

  def card_form_show
    @card = if session[:card]
      Card.new(session[:card])
    else
      Card.new
    end
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
    render :card_form
  end

  def card_set_session
    @card = Card.new(card_param)
    if @card.valid?
      session[:card] = card_param
      redirect_to :checkouts_confirm
    else
      @cart = Cart.find(session[:cart_id])
      @order_details = @cart.order_details
      render :card_form
    end
  end

  def confirm
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
  end

  def issue_receipt
    cart = Cart.find(session[:cart_id])
    card = Card.create(session[:card])
    address = Address.create(session[:address])
    if current_user
      receipt = Receipt.create(cart_id: cart.id, address_id: address.id, card_id: card.id, total_price: cart.price_add_fee, total_price_tax: cart.price_tax_add_fee,user_id: current_user.id)
    else
      receipt = Receipt.create(cart_id: cart.id, address_id: address.id, card_id: card.id, total_price: cart.price_add_fee, total_price_tax: cart.price_tax_add_fee)
    end
    session.delete(:cart_id)
    cart = Cart.create!(user_id: current_user.id) if current_user
    session[:receipt] = [] unless session[:receipt]
    session[:receipt] << receipt.id
    redirect_to :checkouts_completion
  end

  def completed
    @receipts = Receipt.find(session[:receipt].sort!.reverse!)
    render :completion
  end

  private

  def is_cart
    cart = Cart.find(session[:cart_id])
    if cart.is_cart_empty
      redirect_to carts_path
    end
  end

  def has_address_session
    unless session[:address]
      redirect_to carts_path
    end
  end

  def has_card_session
    unless session[:card]
      redirect_to carts_path
    end
  end

  def has_receipt_session
    unless session[:receipt]
      render :completion
    end
  end

  def address_param
    params.require(:address).permit(:postal_code, :prefecture, :city, :address1, :address2, :family_name, :given_name, :email)
  end

  def card_param
    params.require(:card).permit(:name, :card_num, :expiration_date, :security_code)
  end

end
