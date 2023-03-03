require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "Should return http succes" do
      get "/users/show/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "Should return http succes" do
      get "/users/show/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

end
