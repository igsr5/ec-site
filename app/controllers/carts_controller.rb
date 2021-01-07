class CartsController < ApplicationController
  def show
    @order_details = current_cart.order_details
  end
end
