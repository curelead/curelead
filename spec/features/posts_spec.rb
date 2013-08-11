require 'spec_helper'

describe 'posting' do 
  describe 'happy path' do 
    def login(user, password = "password")
      fill_in "username", with: user.username
      fill_in "password", with: password
      click_on "Login"
    end

    let!(:valid_user) {User.create!(username: 'jonas', password: "password")}
    it 'should work for logged in users' do 
      visit root_path
      login(valid_user)
      expect(page).to have_content "Logout"

      visit new_posts_path
      
    end
  end
end
