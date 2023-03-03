class PostsController < ApplicationController
  def index
    @user = User.find(param[:user_id])
    @posts = Post.where(author_id: params[:user_id])
   end

  def show
    @post = Post.find(param[:id])
    @user = User.find(@post.author_id)
  end
end
