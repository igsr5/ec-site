class ProductsController < ApplicationController
  layout 'products'
  def index
    @products = Product.all
    @cart_id = session[:cart_id]
  end

  def show
    @product = Product.find(params[:id])
    @order_detail = OrderDetail.new
  end
end
