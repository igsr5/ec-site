class Cart < ApplicationRecord
  has_many :order_details
end
