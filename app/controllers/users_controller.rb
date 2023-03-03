class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(param[:id])
    @post = @user.last_3_posts
  end
end
