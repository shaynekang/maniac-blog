ManiacBlog::Application.routes.draw do
  resources :posts do
    resources :comments
  end
  
  resources :users, :only => [:create, :destroy]
  
  match "/signin" => "signin#index", :as => :signin
  match "/signout" => "users#destroy", :as => :signout
  
  match "/auth/:provider/callback" => "users#create"
  
  root :to => "welcome#index"
end
