require 'spec_helper'

describe User do
  describe 'validations' do
    let(:user){User.create!(username: "blair", password: "password")}
    before :each do 
      expect(user).to be_valid
    end

    it 'should be invalid without a username' do 
      user.username = nil
      expect(user).to be_invalid
    end

    it 'should not allow duplicate input' do 
      invalid_user = User.create(username: user.username, password: "password")
      expect(invalid_user).to be_invalid
    end

    it 'should be case insensitive' do 
      invalid_user = User.create(username: user.username.upcase, password: "password")
      expect(invalid_user).to be_invalid
    end

    it 'password length should be greater than 3 chars' do 
      invalid_user = User.create(username: "invalid-user", password: "12")
      expect(invalid_user).to be_invalid
    end
  end
end
