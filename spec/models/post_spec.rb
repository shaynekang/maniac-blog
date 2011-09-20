require 'spec_helper'

describe Post do  
  let!(:today) { Factory.create(:post, :created_at => DateTime.now) }
  let!(:yesterday) { Factory.create(:post, :created_at => DateTime.now - 1.day) }
  
  describe "##newest" do
    it "should return latest posts" do
      Post.newest.should == [today, yesterday]
    end
  end
  
  describe "##oldest" do
    it "should return oldest posts" do
      Post.oldest.should == [yesterday, today]
    end
  end
end