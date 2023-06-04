# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Webhooks::TrelloController', type: :request do
  let(:trello_card_id) { '5f1b7b0b7b0b7b0b7b0b7b0b' }
  let(:order) { create(:order, trello_card_id:) }

  describe 'GET /index' do
    it 'returns http success' do
      get "/webhooks/trello/#{trello_card_id}"

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    before do
      payload['trello']['action']['data']['id'] = trello_card_id
      order

      post "/webhooks/trello/#{trello_card_id}", params: payload
    end

    context 'when updateOrder' do
      context 'when listAfter' do
        let(:payload) { JSON.parse File.read('spec/fixtures/webhooks/trello/action_move_card_from_list_to_list.json') }

        it 'payload is incorrect updates aasm_state' do
          expect(order.reload.aasm_state).to eq('готово')
        end
      end
    end
  end
end
