require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "valid attributes" do
    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is valid with a username, password and confirmation password' do
      user = build(:user, password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
  end

  context "invalid attributes" do
    it 'is invalid without a first name' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it 'is invalid without a last name' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a username' do 
      user = build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = build(:user, password: nil)  
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'hashes the password using BCrypt' do
      user = create(:user, password: 'password')

      expect(user.password_digest).not_to eq 'password'

      expect(BCrypt::Password.new(user.password_digest)).to be_truthy

      expect(BCrypt::Password.new(user.password_digest).is_password?('password')).to be true  
    end
  end
end
