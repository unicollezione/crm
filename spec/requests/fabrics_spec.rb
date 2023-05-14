require 'rails_helper'

RSpec.describe 'Fabrics', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/fabrics'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/fabrics/new'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    let(:params) do
      { fabric: { name: 'test' } }
    end

    it 'returns http success' do
      post('/fabrics', params:)

      expect(response).to redirect_to(fabrics_path)
    end

    it 'creates a fabric' do
      expect do
        post('/fabrics', params:)
      end.to change(Fabric, :count).by(1)
    end
  end
end
