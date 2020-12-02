class CartsController < ApplicationController
  def show
    @carts=Cart.all
  end
end
