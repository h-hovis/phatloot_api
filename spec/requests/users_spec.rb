require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:expected_user_structure) do
    {
      "id"=> Integer,
      "first_name"=> String,
      "last_name"=> String,
      "email"=> String,
      "username"=> String,
      "password_digest"=> String,
    }
  end

  describe "GET /users" do
    before do
      create_list(:user, 5)
      get '/users'
      body = JSON.parse(response.body)
    end

    it "returns user" do
      body.each do |user|
        expect(user.keys).to contain_exactly(*expected_user_structure.keys)
      end
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "does not return empty if users exist" do
      expect(body).not_to be_empty
    end

    it "returns 5 users" do
      expect(body.size).to eq(5)
    end
  end

  describe "GET /show" do
    let (:user_id) { create(:user).id }

    before do 
      get "/users/#{user_id}"
      body = JSON.parse(response.body)
    end

    it "checks for the correct structure" do
      expect(body.keys).to contain_exactly(*expected_user_structure.keys)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do

    before do
      post "/users", params: attributes_for(:user)
      body = JSON.parse(response.body)
    end

    it "checks for the correct structure" do
      expect(body.keys).to contain_exactly(*expected_user_structure.keys)
    end

    it "count of users should increase by 1" do
      expect(User.count).to eq(1)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /update" do
    let (:user_id) { create(:user).id }

    before do
      put "/users/#{user_id}", params: { user: 'updated user'}
      body = JSON.parse(response.body)
    end

    it "checks for the correct structure" do
      expect(body.keys).to contain_exactly(*expected_user_structure.keys)
    end

    it "checks if the user is updated" do
      expect(User.find(user_id).user).to eq('updated user')
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    let (:user_id) { create(:user).id }

    before do
      delete "/users/#{user_id}"
    end

    it "decrements the count of users by 1" do
      expect(User.count).to eq(0)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
