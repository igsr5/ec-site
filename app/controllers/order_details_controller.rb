class OrderDetailsController < ApplicationController
  def create
    @orderDetail = OrderDetail.new(order_detail_param)
    if @task.save
      redirect_to carts_path, notice: "タスク「#{@orderDetail.title}」をカートに入れました。"
    else
      redirect_to product_path(@orderDetail.product_id)
    end
  end

  def update
  end

  def destroy
  end

  def order_detail_param
    params.require(:orderDetail).permit(:product_id, :product_count,:cart_id)
  end
end
