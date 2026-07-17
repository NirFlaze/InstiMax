class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if user_signed_in?
      @posts = Post.where(user_id: current_user.following.ids + [current_user.id])
                  .order(created_at: :desc)
    else
      @posts = Post.order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Публикация успешно создана!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path, notice: "Публикация успешно обновлена!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption)
  end
end