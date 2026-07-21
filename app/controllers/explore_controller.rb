class ExploreController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where.not(user_id: current_user.id)
                 .order(created_at: :desc)
  end
end
