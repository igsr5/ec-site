class Address < ApplicationRecord
    validates :family_name, presence: true
    validates :given_name, presence: true
    validates :postal_code, presence: true,length: {within: 7..7}
    validates :prefecture, presence: true
    validates :city, presence: true
    validates :address1, presence: true
    validates :email, presence: true
end
