class Product < ApplicationRecord

    validates :name, :category, :price, :description, presence: true

    belongs_to :user
end
