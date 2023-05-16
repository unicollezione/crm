require 'rails_helper'

RSpec.describe 'Trackings', type: :request do
  describe 'GET /show' do
    let(:order) { create(:order, trello_card_id: '123456789') }

    before do
      order
    end

    it 'returns http success' do
      get "/tracking/#{order.trello_card_id}"

      expect(response).to have_http_status(:success)
    end
  end
end
