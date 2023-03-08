require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          posts_counter: 0)

      @post = Post.create(title: 'Hello',
                          text: 'This is my first post',
                          comments_counter: 0,
                          likes_counter: 0,
                          user: @user)
    end

    it 'Should return http succes' do
      get "/users/#{@user.id}/posts"
      expect(response).to have_http_status(:success)
    end

    it 'Should render  the correct template' do
      get "/users/#{@user.id}/posts"
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          posts_counter: 0)

      @post = Post.create(title: 'Hello',
                          text: 'This is my first post',
                          comments_counter: 0,
                          likes_counter: 0,
                          user: @user)
    end
    it 'Should return http succes' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'Should render  the correct template' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to render_template(:show)
    end
  end
end
