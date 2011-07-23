class WelcomeController < ApplicationController
  expose(:posts) { Post.ordered.page params[:page] }
end