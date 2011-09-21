ManiacBlog::Application.routes.draw do
  resources :posts do
    get 'pages/:page', :action => :index, :on => :collection
    resources :comments
  end
  
  resources :users, :only => [:create, :destroy]
  
  match "/signin" => "signin#index", :as => :signin
  match "/signout" => "users#destroy", :as => :signout
  
  match "/auth/:provider/callback" => "users#create"
  
  root :to => "posts#index"
end
