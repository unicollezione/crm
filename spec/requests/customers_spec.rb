# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :request do # rubocop:disable Metrics/BlockLength
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'get /cusomers/new' do
    it 'responds successfully' do
      get new_customer_path
      expect(response).to be_successful
    end
  end

  describe 'GET /customers' do
    it 'works! (now write some real specs)' do
      get customers_path

      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /customers' do
    it 'works! (now write some real specs)' do
      post customers_path, params: { customer: { nickname: 'Test' } }

      expect(response).to have_http_status(200)
    end

    it 'creates a customer' do
      expect do
        post customers_path, params: { customer: { nickname: 'Test' } }
      end.to change(Customer, :count).by(1)
    end
  end
end
