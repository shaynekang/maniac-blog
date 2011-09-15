require 'spec_helper'

describe Omniauthable do
  class User
    include Omniauthable
  end
  
  let(:auth) { { "provider" => "twitter", "uid" => "37" } }
  let(:user) { Factory.create(:user, :provider => auth['provider'], :uid => auth['uid']) }
  
  describe "#find_or_create_with_omniauth!" do
    before do
      User.any_instance.stub(:insert_info)
    end
    
    context "when user was already sign up" do
      before do
        user.save!
      end
      
      it "should return that user" do
        User.find_or_create_with_omniauth!(auth).should == user
      end
    end
    
    context "when user wasn't sign up yet" do
      it "should create the user" do
        expect { 
          User.find_or_create_with_omniauth!(auth)
        }.to change(User, :count).from(0).to(1)
      end
    end
  end
  
  describe "#insert_info" do
    it "should have username if the auth info has name field" do
      user.insert_info({'name' => 'R.bate'})
      user.name.should == "R.bate"
    end
    
    it "should have username if the auth info has nickname field" do
      user.insert_info({'nickname' => 'rbate'})
      user.name.should == "rbate"
    end
  
    it "should have email if the auth info has email field" do
      user.insert_info({'email' => 'rbate@gmail.com'})
      user.email.should == "rbate@gmail.com"
    end
    
    it "should have image if the auth info has image field" do
      user.insert_info({'image' => 'avatar.png'})
      user.avatar.should == "avatar.png"
    end
  end
end