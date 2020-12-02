class ProductsController < ApplicationController
  layout 'products'
  def index
    @products=Product.all
    @cart_id=session[:cart_id]
  end

  def show
    @product = Product.find(params[:id])
    @orderDetail= OrderDetail.new
  end
end
