# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do # rubocop:disable Metrics/BlockLength
  let(:user) { create(:user) }
  let(:order) { build(:order) }

  before do
    sign_in user
  end

  describe 'GET /orders' do
    it 'returns http success' do
      get orders_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET orders/new' do
    before do
      order.save
    end

    it 'returns http success' do
      get new_order_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET orders/:id' do
    before do
      order.save
    end

    it 'returns http success' do
      get "/orders/#{order.id}"

      expect(response).to have_http_status(:success)
    end
  end
end
