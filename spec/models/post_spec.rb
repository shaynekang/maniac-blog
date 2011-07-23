require 'spec_helper'

describe Post do
  describe "##ordered" do
    it "should return latest posts" do
      today = Factory.create(:post, :created_at => DateTime.now)
      yesterday = Factory.create(:post, :created_at => DateTime.now - 1.day)
      
      Post.ordered.should == [today, yesterday]
    end
  end
end