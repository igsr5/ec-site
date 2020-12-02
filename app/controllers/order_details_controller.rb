class OrderDetailsController < ApplicationController
  def create
    @orderDetail = OrderDetail.new(order_detail_param)
    if @orderDetail.save
      redirect_to carts_path
    else
      redirect_to product_path(@orderDetail.product_id)
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
