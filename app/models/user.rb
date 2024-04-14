class User < ApplicationRecord
    has_many :products

    has_secure_password

    validates :first_name, :last_name, :username, :password, presence: true
    validates :email, presence: true, uniqueness: true
    
end
