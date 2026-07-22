class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @query = params[:query]

    if @query.present?
      @users = User.where("username ILIKE ?", "%#{@query}%")
    else
      @users = []
    end

    @posts = Post.where(
      user_id: current_user.following.ids + [ current_user.id ]
      ).order(created_at: :desc)
  end
end
