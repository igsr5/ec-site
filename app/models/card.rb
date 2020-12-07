class Card < ApplicationRecord
    validates :name, presence: true
    validates :card_num, presence: true,length:{within: 16..16}
    validates :expiration_date, presence: true ,length: {within: 5..5},format: {with: /\A[0-9][0-9]\/[0-9][0-9]\z/}
    validates :security_code, presence: true,length:{within: 3..4}
end