class User < ApplicationRecord
    has_secure_password

    validates :first_name, :last_name, :username, :password, presence: true
    validates :email, presence: true, uniqueness: true
    
    has_many :products
end
