require 'spec_helper'

describe 'User Auth' do 
  describe 'valid credentials' do 
    let(:valid_user) { User.create!(username: "blair", password: "password")}
    before :each do
      expect(valid_user).to be_valid
    end

    it 'shows login on home screen' do 
      visit root_path
      expect( page ).to have_link "Login"
    end

  end

  describe 'invalid credentials' do 
  end
end
