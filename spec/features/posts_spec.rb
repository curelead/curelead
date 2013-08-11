require 'spec_helper'

describe 'posting' do 
  let!(:valid_user) {User.create!(username: 'jonas', password: "password")}
  
  def login(user, password = "password")
    fill_in "username", with: user.username
    fill_in "password", with: password
    click_on "Login"
  end
  
  describe 'happy path' do 
    before :each do 
      visit root_path
      login(valid_user)
      expect(page).to have_content "Logout"
    end

    it 'should work for logged in users' do 
      visit new_post_path
      
      fill_in 'post_brand', with: "NIKE"
      fill_in 'post_title', with: "Jordans and shit"
      fill_in 'post_size', with: "12"
      fill_in 'post_price', with: "150"
      fill_in 'post_body', with: "These are the slickest jordans around"

      click_on "Submit"

      target_post = Post.first
      expect(current_path).to eq post_path(target_post)
      expect(target_post.user.id).to eq valid_user.id
    end
  end
end
