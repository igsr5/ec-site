class ApplicationController < ActionController::Base
  before_action :set_cart_id_session
  helper_method :current_user

  private
  
  def current_user
    @current_user ||= User.find(session[:current_user]) if session[:current_user]
  end

  def set_cart_id_session
    if current_user
      carts=current_user.carts
      if carts.count.zero?
        cart=Cart.create!(user_id: current_user.id)
        session[:cart_id] = cart.id
      else
        session[:cart_id] = carts.last.id
      end
    elsif session[:cart_id].nil?
      cart = Cart.new
      if cart.save!
        session[:cart_id] = cart.id
      end
    end
  end
end
