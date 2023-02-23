require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.create(name: 'Halle', photo: 'Photo', bio: 'Ruby Developper', posts_counter: 0)
    @post = Post.create(user: @user, title: 'Hello', text: 'Hello Rails', comments_counter: 0, likes_counter: 0)
    @like = Like.create(post: @post, user: @user)
  end

  it 'Should updates the likes_counter' do
    @like.send(:update_likes_counter)
    expect(@post.reload.likes_counter).to eq(1)
  end
end
