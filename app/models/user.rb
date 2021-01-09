class User < ApplicationRecord
  has_many :carts
  has_many :addresses
  has_many :receipts
  has_secure_password
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, unless: -> { validation_context == :no_password }
  validates :password_confirmation, presence: true, unless: -> { validation_context == :no_password }

  def full_name
    @full_name = "#{self.family_name} #{self.given_name}"
  end

  def get_payjp_customer
    Payjp.api_key = ENV['PAYJP_API_KEY']
    customer = Payjp::Customer.retrieve(self.customer_id)
    customer
  end
end
