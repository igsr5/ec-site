class ProductsController < ApplicationController
  layout 'products'
  def index
    @products=Product.all
  end

  def show
    @product = Product.find(params[:id])
    @orderDetail= OrderDetail.new
  end
end
