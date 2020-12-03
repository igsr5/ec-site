class Product < ApplicationRecord
  has_one :order_detail

  def price_add_tax_comma
    price_tax = price_tax(self.price)
    price_tax_comma = price_add_comma(price_tax)
    price_tax_comma
  end

  private

  def price_tax(price)
    price_tax = (price * 1.1).floor
    price_tax
  end

  def price_add_comma(price)
    price_comma = price.to_s(:delimited)
    price_comma
  end
end
