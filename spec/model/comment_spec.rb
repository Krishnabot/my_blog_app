require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do
    @user = User.create(name: 'Halle', photo: 'Photo', bio: 'Ruby Developper', posts_counter: 0)
    @post = Post.create(user: @user, title: 'Hello', text: 'Hello Rails', comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(post: @post, user: @user, text: 'Hello World')
  end

  it 'Should update the comments_counter' do
    @comment.send(:update_comments_counter)
    expect(@post.reload.comments_counter).to eq(1)
  end
end
