class PostsController < ApplicationController
  load_and_authorize_resource param_method: :my_sanitizer

  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(my_sanitizer.merge(user: current_user, likes_counter: 0, comments_counter: 0))

    if @post.save
      redirect_to user_posts_url
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end

  private

  def my_sanitizer
    params.require(:post).permit(:title, :text)
  end
end
