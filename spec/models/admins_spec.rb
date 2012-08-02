require 'spec_helper'

describe Post do
  
  before(:each) do
    @post = Factory(:post)
  end

  it "should be able to create a new post" do
    puts @post.errors.inspect
    @post.should be_valid
  end
  it "should be shorter than 150 characters not be valid" do
    Factory.build(:post, :title => 'a'*160).should_not be_valid
  end

  it "should be shorter than 150 characters be valid" do
    Factory.build(:post).should be_valid
  end
  
  it "should not be valid image field" do
     Factory.build(:post, :image_content_type => "image/gif").should_not be_valid

     Factory.build(:post, :image_content_type => "image/jpg").should be_valid
  end

  it "should not be valid image size" do
     Factory.build(:post, :image_file_size => 2**20).should_not be_valid

     Factory.build(:post, :image_file_size => "5000").should be_valid
  end

 
end
