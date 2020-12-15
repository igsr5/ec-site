class ApplicationController < ActionController::Base
  before_action :set_cart_id_session
  helper_method :current_user

  private
  
  def current_user
    @current_user ||= User.find(session[:current_user]) if session[:current_user]
  end

  def set_cart_id_session
    unless session[:cart_id]
      cart = Cart.new
      if cart.save
        session[:cart_id] = cart.id
      end
    end
  end
end
