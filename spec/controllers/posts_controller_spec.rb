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
    
    it_should_behave_like 'expect action', :save!
    it_should_behave_like 'redirect to', :root, "when valid attribute"
    it_should_behave_like 'render template', 'new', 'with invalid attribute'
  end
  
  describe "PUT update" do
    request :put, :update, :id => 1
    
    it_should_behave_like 'expect action', :save!
    it_should_behave_like 'redirect to', :mock_post, "when valid attribute"
    it_should_behave_like 'render template', 'edit', 'with invalid attribute'
  end
  
  describe "DELETE destroy" do
    request :delete, :destroy, :id => 1
    
    it_should_behave_like 'expect action', :destroy
    it_should_behave_like 'redirect to', :root
  end
end

