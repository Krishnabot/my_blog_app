class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes
  belongs_to :user, class_name: 'User'
  after_save :update_posts_counter

  private

  def upadate_post_counter
  author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
