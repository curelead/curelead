require 'spec_helper'

describe Post do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) do
    post = user.posts.build
    post.title = "This is the title"
    post.price = "$123.34"
    post.brand = "NIKE"
    post.body = "This is that awesome post body"
    post
  end
  before :each do 
    expect(post).to be_valid
  end
  describe 'validations' do
    required_attributes = %w(title brand user_id body price)

    required_attributes.each do |validate|
      it "must have a #{validate}" do 
        post.send(:update, validate => nil)
        expect( post ).to be_invalid
      end
    end
  end
end
