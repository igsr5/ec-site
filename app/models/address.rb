class Address < ApplicationRecord
  has_one :receipt
  belongs_to :user

  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :postal_code, presence: true, length: { within: 7..7, message: 'は7桁です。' }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address1, presence: true
  validates :email, presence: true

  def get_full_name
    self.family_name + self.given_name
  end
end
