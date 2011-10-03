class UsersController < ApplicationController
  def create
    @user = User.find_or_create_with_omniauth!(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to :root, :notice => t('notice.signin') # :notice => "Successfully Signed in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to :root, :notice => t('notice.signout') # :notice => "Successfully Signed out!"
  end
end