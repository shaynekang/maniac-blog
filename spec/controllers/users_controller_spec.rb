require 'spec_helper'


describe UsersController do
  mocks :user
  
  describe "POST create" do
    request :post, :create
    
    before do
      User.stub(:find_or_create_with_omniauth!) { mock_user }
    end
    
    it_should_behave_like "redirect to", :root
    it_should_behave_like "assign session", :user_id, 'mock_user.id'
    it_should_behave_like "new notice", "Successfully Signed in!"
    
    it "should assign the user as @user" do
      User.should_receive(:find_or_create_with_omniauth!) { mock_user }
      request
      assigns(:user).should == mock_user
    end
  end
  
  describe "DELETE destroy" do
    request :delete, :destroy
    
    before do
      session[:user_id] = 37
    end

    it_should_behave_like "redirect to", :root
    it_should_behave_like "new notice", "Successfully Signed out!"
  end
end