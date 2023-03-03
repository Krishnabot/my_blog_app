require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'Should return http succes' do
      get '/users/show/posts/index'
      expect(response).to have_http_status(:success)
    end

    it 'Should render  the correct template' do
      get '/users/show/posts'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/show/posts'
      expect(response.body).to include('All the Post for the Current User')
    end
  end

  describe 'GET /show' do
    it 'Should return http succes' do
      get '/users/show/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'Should render  the correct template' do
      get '/users/show/posts/show'
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get '/users/show/posts/show'
      expect(response.body).to include('More information about the Post')
    end
  end
end
