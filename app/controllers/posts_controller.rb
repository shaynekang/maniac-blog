class PostsController < ApplicationController
  before_filter :admin_required, :except => [:show]
  expose(:post)
  
  def create
    post.save!
    redirect_to :root
  rescue ActiveRecord::RecordInvalid
    render 'new'
  end
  
  def update
    post.save!
    redirect_to post
  rescue ActiveRecord::RecordInvalid
    render 'edit'
  end
  
  def destroy
    post.destroy
    redirect_to :root
  end
end