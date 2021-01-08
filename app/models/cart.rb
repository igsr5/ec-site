class Cart < ApplicationRecord
  has_many :order_details
  belongs_to :user, optional: true
  has_one :receipt

  def empty?
    order_count = self.order_details.count
    order_count.zero?
  end

  def price_sum
    order_details = self.order_details
    @price_sum = 0

    order_details.each do |order_detail|
      price = order_detail.product.price * order_detail.product_count
      @price_sum += price
    end
    @price_sum
  end

  def price_sum_tax
    order_details = self.order_details
    @price_sum = 0

    order_details.each do |order_detail|
      price = order_detail.product.price * order_detail.product_count
      @price_sum += price
    end

    @price_sum *= 1.1 # tax
    @price_sum.floor
  end

  def price_add_fee
    @price_add_fee = self.price_sum + 550
    @price_add_fee
  end

  def price_tax_add_fee
    @price_add_fee = self.price_sum_tax + 550
    @price_add_fee
  end

  def price_add_comma
    price_comma = self.price_tax_add_fee.to_s(:delimited)
    price_comma
  end
end
