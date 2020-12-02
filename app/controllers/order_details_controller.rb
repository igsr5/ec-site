class OrderDetailsController < ApplicationController
  def create
    @order_detail = OrderDetail.new(order_detail_param)
    if @order_detail.save
      redirect_to carts_path(@order_detail.cart_id)
    else
      redirect_to product_path(@order_detail.product_id)
    end
  end

  def update
  end

  def destroy
  end

  def order_detail_param
    params.require(:order_detail).permit(:product_id, :product_count,:cart_id)
  end
end
