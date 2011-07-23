require 'spec_helper'

describe ApplicationController do
  mocks :user
  
  describe "#current_user" do
    context "with logged in user" do
      it "should return the current user" do
        User.should_receive(:find).with(37) { mock_user }
        session[:user_id] = 37
        controller.current_user.should == mock_user
      end
    end
    
    context "without logged in" do
      it "should return nil" do
        controller.current_user.should == nil
      end
    end
  end
  
  describe "#logged_in?" do
    context "with logged in user" do
       before do
         controller.stub(:current_user) { mock_user }
       end
    
      it "should return true" do
        controller.should be_logged_in
      end
    end
    
    context "without logged in" do
       before do
         controller.stub(:current_user) { nil }
       end
       
       it "should be false" do
         controller.should_not be_logged_in
       end
    end
  end
  
  describe "#login_required" do
    context "with logged in user" do
       before do
         controller.stub(:logged_in?) { true }
       end

       it "should be success" do
         controller.login_required
         response.should be_success
       end
     end

     context "without logged in" do
       before do
         controller.stub(:logged_in?) { false }
       end

       it "should redirect to the sigin page" do
         controller.should_receive(:redirect_to).with(:signin, :notice => "Need to sign in")
         controller.login_required
       end
     end
   end
  
  describe "#admin?" do
    context "with admin role" do
      before do
        controller.stub(:current_user) { mock_user(:admin => true) }
      end
      
      it "should be true" do
        controller.should be_admin
      end
    end
    
    context "with no logged in user" do
      before do
        controller.stub(:current_user) { nil }
      end
      
      it "should be false" do
        controller.should_not be_admin
      end
    end
    
    context "without admin role" do
      before do
        controller.stub(:current_user) { mock_model(User, :admin => false) }
      end
      
      it "should be false" do
        controller.should_not be_admin
      end
    end
  end
    
  describe "#admin_required" do
    context "with admin role" do
      before do
        controller.stub(:admin?) { true }
      end
      
      it "should be success" do
        controller.admin_required
        response.should be_success
      end
    end
    
    context "without admin role" do
      before do
        controller.stub(:admin?) { false }
      end
      
      it "should redirect to the sigin page" do
        controller.should_receive(:redirect_to).with(:signin, :notice => "Need admin role")
        controller.admin_required
      end
    end
  end
end