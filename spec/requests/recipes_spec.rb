require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/recipes'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /index' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      @recipe = Recipe.first
      get "/recipes/#{@recipe.id}"
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end
  end
end
