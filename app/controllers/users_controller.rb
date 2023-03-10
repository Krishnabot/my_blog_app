class UsersController < ApplicationController
  before_action :load_user, only: :show

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts.includes(:user).order(created_at: :desc).limit(3)
  end

  private

  def load_user
    @user = User.includes(:posts).find(params[:id])
  end
end
