require 'spec_helper'


describe UsersController do
  mocks :user
  subject { mock_user }
  
  describe "POST create" do
    request :post, :create
    
    before do
      User.stub(:find_or_create_with_omniauth!) { mock_user }
    end
    
    it_behaves_like "redirect to", :root
    it_behaves_like "assign session", :user_id, 'mock_user.id'
    it_behaves_like "new notice", "Successfully Signed in!"
    it_behaves_like "expect action to class", :find_or_create_with_omniauth!
    it_behaves_like "assign value", :user, 'mock_user'
  end
  
  describe "DELETE destroy" do
    request :delete, :destroy
    
    before do
      session[:user_id] = 37
    end

    it_behaves_like "redirect to", :root
    it_behaves_like "new notice", "Successfully Signed out!"
  end
end