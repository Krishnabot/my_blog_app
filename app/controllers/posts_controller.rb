class PostsController < ApplicationController
  def index
    @user = User.find(param[:user_id])
    @posts = Post.where(author_id: params[:user_id])
   end

  def show; end
end
