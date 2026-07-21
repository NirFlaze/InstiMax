class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    unless @post.likes.exists?(user: current_user)
      @post.likes.create(user: current_user)
    end

    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])

    like = @post.likes.find_by(user: current_user)
    like.destroy if like

    redirect_to posts_path
  end
end
