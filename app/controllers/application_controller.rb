class ApplicationController < ActionController::Base  
  protect_from_forgery
  helper_method :current_user, :admin?, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user
  end
  
  def login_required
    redirect_to :signin, :notice => "Need to sign in" unless logged_in?
  end
  
  def admin?
    current_user && current_user.admin
  end
  
  def admin_required
    redirect_to :signin, :notice => "Need admin role" unless admin?
  end
end
