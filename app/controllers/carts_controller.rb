class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
    @order_details = @cart.order_details
  end
end
