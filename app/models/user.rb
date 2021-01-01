class User < ApplicationRecord
  has_many :carts
  has_many :addresses
  has_many :cards
  has_many :receipts
  has_secure_password
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, unless: -> { validation_context == :hoge }
  validates :password_confirmation, presence: true, unless: -> { validation_context == :hoge }

  def full_name
    @full_name = "#{self.family_name} #{self.given_name}"
  end
end
