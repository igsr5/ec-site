class ProductsController < ApplicationController
  layout 'products'
  def index
    @products=Product.all
  end

  def show
  end
end
