require 'spec_helper'

describe User do
  include FactoryGirl::Fixtures

  describe "#find_or_create_with_omniauth!" do
    context "when user was already sign up" do
      before do
        user.save!
      end
      
      it "should return that user" do
        User.find_or_create_with_omniauth!(auth).should == user
      end
    end
    
    context "when user wasn't sign up yet" do
      it "should create the user user" do
        expect { 
          User.find_or_create_with_omniauth!(auth)
        }.to change(User, :count).from(0).to(1)
      end
    end
  end
end