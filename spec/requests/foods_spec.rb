require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /index' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/foods'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end
  end

  describe 'Check content of page' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/foods'
    end

   it 'includes placeholder text' do
      expect(response.body).to include('Foods Page')
    end
   
    it 'includes placeholder text' do
      expect(response.body).to include('Add Food')
    end
  end
end
