class Receipt < ApplicationRecord
    belongs_to :cart
    belongs_to :address
    belongs_to :card
end
