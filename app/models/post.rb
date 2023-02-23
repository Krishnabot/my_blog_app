class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes
  belongs_to :user, class_name: 'User'
  after_save :update_posts_counter
  validates :title, presence: true, length: { maximum: 250}
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true}
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true}


  private

  def upadate_post_counter
  author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
