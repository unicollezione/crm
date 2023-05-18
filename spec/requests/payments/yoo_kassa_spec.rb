# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Payments::YooKassas', type: :request do # rubocop:disable Metrics/BlockLength
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
    let(:params) do
      {
        'authenticity_token' => '[FILTERED]',
        'phone' => '',
        'email' => 'alx.ekb@gmail.com',
        'full_name' => 'Алексей',
        'product' => 'Брюки UNI#4',
        'fabric' => 'Джинсовый деним Green',
        'order' => '',
        'amount' => '200',
        'commit' => 'ссылка'
      }
    end

    it 'returns http success' do
      post('/payments/yoo_kassa', params:)

      expect(response).to have_http_status(:success)
    end
  end
end
