FactoryBot.define do
  factory :receipt do
    cart_id { 1 }
    address_id { 1 }
    card_id { 1 }
    total_price { 1 }
    total_price_tax { 1 }
  end
end
