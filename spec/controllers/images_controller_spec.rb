require 'spec_helper'

describe ImagesController do
  let(:user) { FactoryGirl.create(:user, :with_post_with_image)}
  let(:post) { user.posts.first }
  let(:image){ post.images.first }
  let(:valid_attributes) { {"url" => "mystring"} }

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
