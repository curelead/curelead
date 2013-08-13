require 'spec_helper'

describe 'posting' do 

  let!(:valid_user) {User.create!(username: 'jonas', password: "password")}
  let!(:next_valid_user) {User.create!(username: 'blair', password: "password")}
  
  def create_post_for_user(user = valid_user)
    Post.create do |p|
      p.brand = "NIKE"
      p.title = "Jordans and shit"
      p.size  = "12"
      p.price = "150"
      p.user_id = user.id
      p.body  = "These are the slickest jordans around"
    end
  end

  def login(user, password = "password")
    visit root_path
    expect(page).to have_field "username"
    fill_in "username", with: user.username
    expect(page).to have_field "password"
    fill_in "password", with: password
    click_on "Login"
  end

  def create_valid_post
    visit new_post_path
    fill_in 'post_brand', with: "NIKE"
    fill_in 'post_title', with: "Jordans and shit"
    fill_in 'post_size', with: "12"
    fill_in 'post_price', with: "150"
    fill_in 'post_body', with: "These are the slickest jordans around"

    click_on "Submit"
  end
  
  describe 'valid user' do 
    before :each do 
      visit root_path
      login(valid_user)
      expect(page).to have_content "Logout"
    end

    it 'should be able to create a post' do 
      visit new_post_path
      
      create_valid_post

      target_post = Post.first
      expect(current_path).to eq post_path(target_post)
      expect(target_post.user.id).to eq valid_user.id
    end

    it 'should be able to edit their own posts' do 
      visit new_post_path

      create_valid_post

      target_post = Post.first
      expect( target_post.user.id ).to eq valid_user.id

      visit edit_post_path(target_post)
      fill_in 'post_price', with: "250"
      click_on 'Submit'

      expect( current_path ).to eq post_path(target_post)
      expect( page ).to have_content  "250"
    end
  end

  describe 'un-authenticated user' do 
    before :each do 
      create_post_for_user(valid_user)
    end
    it 'should not be able to create a post' do 
      visit new_post_path
      expect( page ).to have_content "Login or Create Account"
    end

    it 'should not be able to edit another users posting' do 
      target_post = Post.first
      expect( target_post.user.id ).to eq valid_user.id
      
      login(next_valid_user)
      expect(page).to have_content "Logout"

      visit edit_post_path(target_post)
      expect( current_path ).to eq new_sessions_path
      expect( page ).to have_content "You are not authorized"
    end
  end
end
