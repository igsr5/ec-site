class UsersController < ApplicationController
  before_action :has_user_session, except: [:new, :create]
  def show
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

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
    @user.name = params[:user][:name]
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
        current_user.destroy
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def has_user_session
    redirect_to :login unless current_user
  end
end
