class ProductsController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @products = pagy(Product.all, items: 9)
    @cart_id = session[:cart_id]
  end

  def show
    @product = Product.find(params[:id])
    @order_detail = OrderDetail.new
  end
end
