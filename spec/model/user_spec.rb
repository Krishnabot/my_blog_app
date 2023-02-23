require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(name: 'Halle', photo: 'Photo', bio: 'Ruby Developper', posts_counter: 0)
    @posts = []
  end

  it 'Should be present' do
    @user.name = 'Halle'
    expect(@user).to be_valid
  end

  it 'posts_counter must be an integer and >= to zero' do
    @user.posts_counter = 0
    expect(@user).to be_valid
  end

  it 'should return the last 3 posts of a User' do
    result = @user.last_3_posts
    expect(result).to eq(@posts)
  end
end
