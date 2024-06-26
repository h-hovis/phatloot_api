require 'rails_helper'

RSpec.describe Product, type: :model do
  
  context "valid attributes" do
    it 'is valid with valid attributes' do
      product = build(:product)
      expect(product).to be_valid
    end
  end

  context "invalid attributes" do
    it 'is invalid without a name' do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a category' do
      product = build(:product, category: nil)
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

  end
end
