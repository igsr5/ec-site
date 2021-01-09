class UsersController < ApplicationController
  before_action :has_user_session, except: [:new, :create]
  def show
    Payjp.api_key = ENV['PAYJP_API_KEY']
    @order_details = current_cart.order_details
    @address = Address.new
    customer = current_user.get_payjp_customer
    @card = customer.cards.retrieve(customer.default_card) if customer.default_card

    @addresses = current_user.addresses
  end

  def new
    @user = User.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_API_KEY']
    @user = User.new(user_params)
    customer = current_user.get_payjp_customer
    @user.customer_id = customer.id
    if @user.save
      redirect_to :login if @user.valid?
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(user_edit_params)
    if @user.save(context: :no_password)
      redirect_to :users
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    if params[:password]
      if @user&.authenticate(params[:password])
        current_user.destroy!
        session.clear
        redirect_to :root
      else
        @error_msg = 'パスワードが違います。'
        render :delete_confirm
      end
    else
      render :delete_confirm
    end
  end

  def add_card
    customer = current_user.get_payjp_customer
    customer.cards.create(
      card: params[:payjp_token],
      default: true,
    )
    redirect_to :users
  end

  def delete_card
    Payjp.api_key = ENV['PAYJP_API_KEY']
    customer = current_user.get_payjp_customer
    if customer.default_card
      card = customer.cards.retrieve(customer.default_card)
      card.delete
    end
    redirect_to :users
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :given_name, :email, :password, :password_confirmation)
  end

  def user_edit_params
    params.require(:user).permit(:family_name, :given_name, :email)
  end

  def has_user_session
    redirect_to :login unless current_user
  end
end
