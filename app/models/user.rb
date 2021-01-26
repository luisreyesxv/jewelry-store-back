class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_many :items, through: :orders

    validates :email, uniqueness: true, presence: true
    validates :password, length: { in: 6..20 }, on: :create

end
