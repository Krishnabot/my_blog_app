require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "Should return http success" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end
    it 'Should render  the correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it "Should return http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end
        it 'Should render  the correct template' do
      get '/users/show'
      expect(response).to render_template(:show)
    end
  end

end
