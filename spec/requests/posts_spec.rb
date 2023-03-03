require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "Should return http succes" do
      get "/users/show/posts/index"
      expect(response).to have_http_status(:success)
    end

    it 'Should render  the correct template' do
      get '/users/show/posts'
      expect(response).to render_template(:index)
    end

  end

  describe "GET /show" do
    it "Should return http succes" do
      get "/users/show/posts/show"
      expect(response).to have_http_status(:success)
    end

    it 'Should render  the correct template' do
      get '/users/show/posts/show'
      expect(response).to render_template(:show)
    end
  end

end
