class Card < ApplicationRecord
  has_one :receipt

  validates :name, presence: true
  validates :card_num, presence: true, length: { within: 16..16, message: 'は16桁です。' }
  validates :expiration_date, presence: true, format: { with: %r{\A[0-9][0-9]/[0-9][0-9]\z}, message: 'は00/00の形式です。' }
  validates :security_code, presence: true, length: { within: 3..4, message: 'は3桁、もしくは4桁です。' }
end
