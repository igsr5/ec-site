class User < ApplicationRecord
  has_many :carts
  has_many :addresses
  has_many :receipts
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, unless: -> { validation_context == :hoge }
  validates :password_confirmation, presence: true, unless: -> { validation_context == :hoge }
end
