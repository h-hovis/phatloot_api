require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:expected_product_structure) do
    {
      "id"=> Integer,
      "name"=> String,
      "category"=> String,
      "price"=> Decimal,
      "description"=> String,
      "image_url"=> String,
    }
  end

  describe "GET /index" do
    before do
      create_list(:product, 10)
      get "/products/my_products"
      body = JSON.parse(response.body) 
    end

    it "returns products" do
      body.each do |product|
        expect(product.keys).to contain_exactly(*expected_product_structure.keys)
      end
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "does not return empty if products exist" do
      expect(body).not_to be_empty
    end

    it "returns 10 products" do
      expect(body.size).to eq(10)
    end
  end

  describe "GET /show" do
    let (:product_id) { create(:product).id }

    before do
      get "/products/my_products/#{product_id}"
      body = JSON.parse(response.body)
    end

    it "checks for the correct structure" do
      expect(body.keys).to contain_exactly(*expected_product_structure.keys)
    end

    it "returns http success" do  
      expect(response).to have_http_status(:success)
  end
end

describe "POST /create" do

  before do
    post "/products", params: attributes_for(:product)
    body = JSON.parse(response.body)
  end

  it "checks for the correct structure" do
    expect(body.keys).to contain_exactly(*expected_product_structure.keys)
  end

  it "count of products should increase by 1" do
    expect(Product.count).to eq(1)
  end

  it "returns http success" do
    expect(response).to have_http_status(:success)
  end
end

describe "PUT /update" do
  let (:product_id) { create(:product).id } 

  before do
    put "/products/#{product_id}", params: { product: 'updated product' }
    body = JSON.parse(response.body)
  end

  it "checks for the correct structure" do
    expect(body.keys).to contain_exactly(*expected_product_structure.keys)
  end

  it "checks if the product is updated" do
    expect(Product.find(product_id).product).to eq('updated product')
  end

  it "returns http success" do  
    expect(response).to have_http_status(:success)
  end
end

describe "DELETE /destroy" do
  let (:product_id) { create(:product).id }

  before do
    delete "/products/#{product_id}"
  end

  it "decrements the count of products by 1" do
    expect(Product.count).to eq(0)
  end

  it "returns http success" do
    expect(response).to have_http_status(:success)
  end
end
end