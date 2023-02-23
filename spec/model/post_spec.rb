require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(name: 'Halle', photo: 'Photo', bio: 'Ruby Developper', posts_counter: 0)
    @post = Post.create(user: @user, title: 'Hello', text: 'Hello Rails', comments_counter: 0, likes_counter: 0)
    @comments = []
  end

  it 'Should be present and <= 250 characters' do
    @post.title = 'Hello'
    expect(@post).to be_valid
  end

  it 'comments_counter should be an integer and sould be  >= 0 ' do
    @post.comments_counter = 0
    expect(@post).to be_valid
  end

  it 'likes_counter should be an integer and sould be  >= 0' do
    @post.likes_counter = 0
    expect(@post).to be_valid
  end

  it 'should return the five most recent comments' do
    result = @post.five_most_recent_comments
    expect(result).to eq(@comments)
  end

  it 'Should updates the posts_counter' do
    @post.send(:update_posts_counter)
    expect(@user.reload.posts_counter).to eq(1)
  end
end
