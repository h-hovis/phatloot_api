class User < ApplicationRecord
    has_many :products

    validates :first_name, :last_name, :email, :username, :password, presence: true
end
