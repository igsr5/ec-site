class Card < ApplicationRecord
  has_one :receipt
  belongs_to :user, optional: true
end
