module FactoryGirl
  module Fixtures
    def user
      @user ||= Factory(:user)
    end
  
    def post 
      @post ||= Factory(:post, :user => user)
    end
  
    def comment
      @comment ||= Factory(:comment, :user => user, :post => post)
    end
    
    def auth
      @auth ||= make_omniauth_authentication
    end
  end
end