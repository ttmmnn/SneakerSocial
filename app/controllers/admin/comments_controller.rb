class Admin::CommentsController < ApplicationController

  def update
    @post = Post.find(params[:post_id])

  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to admin_post_path(params[:post_id])
  end

end
