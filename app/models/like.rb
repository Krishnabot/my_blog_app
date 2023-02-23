class Like < ApplicationRecord
  belongs_to :user
  belongs_to :Post
  after_save :update_likes_counter

  private
  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
