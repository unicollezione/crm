require 'rails_helper'

RSpec.describe 'Payments::YooKassas', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET' do
    it 'returns http success' do
      get '/payments/yoo_kassa'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST', :vcr do
    it 'returns http success' do
      post '/payments/yoo_kassa', params: { description: 'test', amount: 1 }

      expect(response).to have_http_status(:success)
    end
  end
end
