class Cart < ApplicationRecord
  has_many :order_details

  def price_sum
    orde_details=self.order_details
    @price_sum=0

    order_details.each do |order_detail|
      price=order_detail.product.price * order_detail.product_count
      @price_sum+=price
    end

    @price_sum*=1.1 #tax
    return @price_sum.floor
  end

  def price_add_fee
    @price_add_fee=self.price_sum()+550
    return @price_add_fee
  end
end
