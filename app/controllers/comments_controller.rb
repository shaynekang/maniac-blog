class CommentsController < ApplicationController
  before_filter :login_required
  
  expose(:post) { Post.find(params[:post_id]) }
  expose(:comments) { post.comments }
  expose(:comment)
  
  def create
    comment.user_id = current_user
    comment.save!
    redirect_to post
  rescue ActiveRecord::RecordInvalid
    render 'posts/show'
  end
  
  def destroy
    comment.destroy
    redirect_to post
  end
end