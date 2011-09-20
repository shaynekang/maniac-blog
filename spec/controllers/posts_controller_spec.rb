require 'spec_helper'

describe PostsController do
  mocks :post
  subject { mock_post }
  
  before do
    controller.stub(:post) { subject }
    controller.stub(:current_user) { mock_model(User, :admin => true) }
  end

  describe "POST create" do
    request :post, :create
    
    it_behaves_like 'expect action', :save!
    
    it_behaves_like "with valid attribute" do
      it_behaves_like 'redirect to', :root
    end
    
    it_behaves_like "without valid attribute" do
      it_behaves_like 'render template', 'new'
    end
  end
  
  describe "PUT update" do
    request :put, :update, :id => 1
    
    it_behaves_like 'expect action', :save!
    
    it_behaves_like "with valid attribute" do
      it_behaves_like 'redirect to', :mock_post
    end
    
    it_behaves_like "without valid attribute" do
      it_behaves_like 'render template', 'edit'
    end
  end
  
  describe "DELETE destroy" do
    request :delete, :destroy, :id => 1
    
    it_behaves_like 'expect action', :destroy
    it_behaves_like 'redirect to', :root
  end
end

