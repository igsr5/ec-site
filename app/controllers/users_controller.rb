class UsersController < ApplicationController
  before_action :has_user_session, except: [:new, :create]
  def show
    Payjp.api_key = ENV['PAYJP_API_KEY']
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
    @address = Address.new
    customer = Payjp::Customer.retrieve(current_user.customer_id)
    @card = customer.cards.retrieve(customer.default_card) if customer.default_card

    @addresses = current_user.addresses
  end

  def new
    @user = User.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_API_KEY']
    @user = User.new(user_params)
    customer = Payjp::Customer.create
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
    @user.family_name = params[:user][:family_name]
    @user.given_name = params[:user][:given_name]
    @user.email = params[:user][:email]
    if @user.save(context: :hoge)
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

  private

  def user_params
    params.require(:user).permit(:family_name, :given_name, :email, :password, :password_confirmation)
  end

  def has_user_session
    redirect_to :login unless current_user
  end
end
