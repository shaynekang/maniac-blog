require 'spec_helper'

describe Post do
  # class Post
  #   include ActiveRecord::Extensions::Orderable
  # end
  
  describe "##ordered" do
    it "should return latest posts" do
      today = Factory.create(:post, :created_at => DateTime.now)
      yesterday = Factory.create(:post, :created_at => DateTime.now - 1.day)
      
      Post.newest.should == [today, yesterday]
    end
  end
end