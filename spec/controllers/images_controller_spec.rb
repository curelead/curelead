require 'spec_helper'

describe ImagesController do
  let!(:user) { User.create!(username: "userjhgfd", password: "password")}
  let(:valid_attributes) { {"url" => "mystring"} }
  let!(:post) do 
    post = Post.new
    post.user_id = user.id
    post.save
    post
  end

  let(:image) do 
    Image.create! do |i|
      i.post_id = post.id
      i.url = "http://filepicker.com"
    end
  end


  describe "GET index" do
    it "assigns all images as images" do
      get :index, :post_id => post.id
      assigns(:images).should eq([image])
    end
  end

  describe "GET show" do
    it "assigns the requested image as @image" do
      get :show, {:id => image.to_param}
      assigns(:image).should eq(image)
    end
  end
end
