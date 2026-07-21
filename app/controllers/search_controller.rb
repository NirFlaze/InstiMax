class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    @query = params[:query]

    if @query.present?
      @users = User.where("username ILIKE ?", "%#{@query}%")
    else
      @users = []
    end
  end
end
