class CheckoutsController < ApplicationController
  include Pagy::Backend
  before_action :is_cart, except: [:completed]
  before_action :has_address_session, only: [:card_form_show, :confirm]
  before_action :has_card_session, only: [:confirm]

  def address_form_show
    @address = if session[:address]
      Address.new(session[:address])
    else
      Address.new
    end
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
    if current_user
      @addresses = current_user.addresses
      render :address_form_user
    else
      render :address_form
    end
  end

  def address_set_session
    session[:is_save_address] = params[:page][:is_save] if current_user
    session[:address_radio] = params[:page][:category] 
    if params[:page][:category] == "new"
      @address = Address.new(address_param)
      if @address.valid?
        session[:address] = address_param
        session[:address][:user_id] = current_user.id if current_user && params[:page][:is_save]
        redirect_to :checkouts_card
      else
        @cart = Cart.find(session[:cart_id])
        @order_details = @cart.order_details
        if current_user
          @addresses = current_user.addresses 
          render :address_form_user
        else
          render :address_form
        end
      end
    else
      session[:address] = Address.find(params[:page][:category])
      redirect_to :checkouts_card
    end
  end

  def card_form_show
    @card = Card.new
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
     if current_user
      @cards = current_user.cards
      render :card_form_user
    else
      render :card_form 
    end
  end

  def card_set_session
    session[:is_save_card] = params[:page][:is_save] if current_user
    session[:card_radio] = params[:page][:category] 
    if params[:page][:category] == "new"
      session[:payjp_token] = params[:payjp_token]
      session[:card][:user_id] = current_user.id if current_user && params[:page][:is_save]
      redirect_to :checkouts_confirm 
    else
      session[:card] = Card.find(params[:page][:category])
      redirect_to :checkouts_confirm
    end
  end

  def confirm
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
  end

  def issue_receipt
    cart = Cart.find(session[:cart_id])
    if session[:address_radio] == "new"
      address = Address.create!(session[:address])
    else
      address = Address.find(session[:address_radio])
    end

    if session[:card_radio] == "new"
      card = Card.new(token: session[:payjp_token])
      card.save
    else
      card = Card.find(session[:card_radio])
    end

    if current_user
      Receipt.create(cart_id: cart.id, address_id: address.id, card_id: card.id, total_price: cart.price_add_fee, total_price_tax: cart.price_tax_add_fee,user_id: current_user.id)
    else
      receipt=Receipt.create(cart_id: cart.id, address_id: address.id, card_id: card.id, total_price: cart.price_add_fee, total_price_tax: cart.price_tax_add_fee)
      session[:receipt] = [] unless session[:receipt]
      session[:receipt] << receipt.id
    end
    session_clear
    cart = Cart.create!(user_id: current_user.id) if current_user
    redirect_to :checkouts_completion
  end

  def completed
    if current_user
      @pagy,@receipts = pagy(current_user.receipts.order(id: "DESC"), items: 6)
    elsif session[:receipt]
      @pagy,@receipts = pagy(Receipt.where(id: session[:receipt]),items: 6)
    end
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
    unless session[:payjp_token]
      redirect_to carts_path
    end
  end

  def address_param
    params.require(:address).permit(:postal_code, :prefecture, :city, :address1, :address2, :family_name, :given_name, :email)
  end

  def session_clear 
    session.delete(:cart_id)
    session.delete(:address)
    session.delete(:card)
    session.delete(:payjp_token)
    session.delete(:address_radio)
    session.delete(:card_radio)
    session.delete(:is_save_card)
    session.delete(:is_save_address)
  end

end
