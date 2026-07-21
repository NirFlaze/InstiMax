class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    @post.likes.create(user: current_user)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: posts_path }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])

    @post.likes.find_by(user: current_user)&.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: posts_path }
    end
  end
end
