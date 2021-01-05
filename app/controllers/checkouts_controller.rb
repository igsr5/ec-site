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
    if params[:page][:category] == 'new'
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
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
    if current_user
      Payjp.api_key = ENV['PAYJP_API_KEY']
      customer = Payjp::Customer.retrieve(current_user.customer_id)
      @customer_card = customer.cards.retrieve(customer.default_card) if customer.default_card
      render :card_form_user
    else
      render :card_form
    end
  end

  def card_set_session
    session[:is_save_card] = params[:page][:is_save] if current_user
    session[:card_radio] = params[:page][:category]
    if params[:page][:category] == 'new'
      session[:payjp_token] = params[:payjp_token]
      session[:is_save_card] = current_user.id if current_user && params[:page][:is_save]
    end
    redirect_to :checkouts_confirm
  end

  def confirm
    Payjp.api_key = ENV['PAYJP_API_KEY']
    if session[:card_radio] == 'default'
      customer = Payjp::Customer.retrieve(current_user.customer_id)
      @customer_card = customer.cards.retrieve(customer.default_card)
    else
      @customer_card = Payjp::Token.retrieve(session[:payjp_token]).card
    end
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
  end

  def issue_receipt
    cart = Cart.find(session[:cart_id])
    address = if session[:address_radio] == 'new'
      Address.create!(session[:address])
    else
      Address.find(session[:address_radio])
    end

    Payjp.api_key = ENV.fetch('PAYJP_API_KEY')

    if session[:is_save_card]
      customer = Payjp::Customer.retrieve(current_user.customer_id)
      customer.cards.create(
        card: session[:payjp_token],
        default: true,
      )
      charge = Payjp::Charge.create(
        customer: customer.id,
        amount: cart.price_tax_add_fee,
        currency: 'jpy',
      )
    elsif session[:card_radio] == 'default'
      customer = Payjp::Customer.retrieve(current_user.customer_id)
      charge = Payjp::Charge.create(
        customer: customer.id,
        amount: cart.price_tax_add_fee,
        currency: 'jpy',
      )
    else
      charge = Payjp::Charge.create(
        card: session[:payjp_token],
        amount: cart.price_tax_add_fee,
        currency: 'jpy',
      )
    end

    if current_user
      Receipt.create!(cart_id: cart.id, address_id: address.id, total_price: cart.price_add_fee, total_price_tax: cart.price_tax_add_fee, user_id: current_user.id, charge_id: charge.id)
    else
      receipt = Receipt.create!(cart_id: cart.id, address_id: address.id, total_price: cart.price_add_fee, total_price_tax: cart.price_tax_add_fee, charge_id: charge.id)
      session[:receipt] = [] unless session[:receipt]
      session[:receipt] << receipt.id
    end

    session_clear
    cart = Cart.create!(user_id: current_user.id) if current_user
    redirect_to :checkouts_completion
  end

  def completed
    Payjp.api_key = ENV['PAYJP_API_KEY']
    if current_user
      @pagy, @receipts = pagy(current_user.receipts.order(id: 'DESC'), items: 6)
    elsif session[:receipt]
      @pagy, @receipts = pagy(Receipt.where(id: session[:receipt]).order(id: 'DESC'), items: 6)
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
    unless session[:payjp_token] || session[:card_radio] == 'default'
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
