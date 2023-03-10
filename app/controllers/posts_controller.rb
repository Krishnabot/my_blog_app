class PostsController < ApplicationController
  before_action :load_user
  load_and_authorize_resource

  def index
    @posts = @user.posts.includes(:user)
  end

  def show; end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(form_params)

    if @post.save
      redirect_to user_posts_url(@user)
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def load_user
    @user = User.includes(:posts).find(params[:user_id])
  end

  def form_params
    params.require(:post).permit(:title, :text).merge(user: current_user, likes_counter: 0, comments_counter: 0)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
