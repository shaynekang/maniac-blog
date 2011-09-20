require 'spec_helper'

describe CommentsController do
  mocks :post, :comment
  subject { mock_comment }
  
  before do
    controller.stub(:post) { mock_post }
    controller.stub(:comment) { mock_comment }
    controller.stub(:login_required) { true }
  end
  
  describe "POST create" do
    request :post, :create, :post_id => 1
    
    it_behaves_like "expect action", :save!
    
    it_behaves_like "with valid attribute" do
      it_should_behave_like 'redirect to', :mock_post
    end
    
    it_behaves_like "without valid attribute" do
      it_behaves_like 'render template', 'posts/show'
    end
  end
  
  describe "DELETE destroy" do
    request :delete, :destroy, :post_id => 1, :id => 1
    
    it_behaves_like 'redirect to', :mock_post
    it_behaves_like "expect action", :destroy
  end
end