# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Items', type: :request do
  let(:user) { create(:user) }
  let(:item) { create(:product) }

  before do
    sign_in user
  end

  describe 'GET /items' do
    it 'returns http success' do
      get '/items'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/items/#{item.id}"

      expect(response).to have_http_status(:success)
    end
  end
end
