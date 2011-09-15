require 'spec_helper'

describe User do
  let(:auth) do
    {'provider' => 'twitter','uid' => '37'}
  end
  
  describe "#find_or_create_with_omniauth!" do
    context "when user was already sign up" do
      let!(:user) do
        Factory.create(:user, :provider => auth['provider'], :uid => auth['uid'])
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