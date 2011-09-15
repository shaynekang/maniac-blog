class WelcomeController < ApplicationController
  expose(:posts) { Post.newest.page params[:page] }
end