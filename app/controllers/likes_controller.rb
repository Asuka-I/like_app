class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.likes.create!(post_id: @post.id)
  end

  def destroy
    current_user.likes.find_by(post_id: params[:post_id]).destroy!
    @post = Post.find(params[:post_id])
  end
end
