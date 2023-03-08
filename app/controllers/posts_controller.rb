class PostsController < ApplicationController
def index
  @user = User.includes(:posts).find(params[:user_id])
  @posts = @user.posts.includes(:user)
end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(form_params.merge(user: current_user, likes_counter: 0, comments_counter: 0))

    if @post.save
      redirect_to user_posts_url
    else
      render :new
    end
  end

  private

  def form_params
    params.require(:post).permit(:title, :text)
  end
end
