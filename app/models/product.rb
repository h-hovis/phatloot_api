class Product < ApplicationRecord

    validates :name, :category, :price, :description, presence: true
end
