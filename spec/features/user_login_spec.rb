require 'spec_helper'

describe 'User Auth' do 
  username = "blair"
  password = "password"
  let!(:valid_user) { FactoryGirl.create(:user, username: username, password: password) }

  before :each do
    expect(valid_user).to be_valid
  end

  describe 'valid credentials' do 
    it 'user can login on home screen' do 
      visit root_path
      expect( page ).to have_field "username"
      expect( page ).to have_field "password"

      fill_in "username", with: valid_user.username
      fill_in "password", with: password
      click_on "Login"
      expect( page ).to have_content "Logout"
    end
  end

  describe 'invalid credentials' do 
    it 'user cannot login' do 
      visit root_path
      fill_in "username", with: valid_user.username
      fill_in "password", with: password + "654"
      click_on "Login"
      expect( page ).to have_content "Login Failed"
    end
  end
end
