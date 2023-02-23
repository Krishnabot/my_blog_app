class Like < ApplicationRecord
  belongs_to :user
  belongs_to :Post
  after_save :update_likes_counter

  private
  def update_likes_counter
    post.increament!(:likes_counter)
  end
end
