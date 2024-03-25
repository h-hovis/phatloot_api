class User < ApplicationRecord
    has_many :products

    validates :first_name, :last_name, :password, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
