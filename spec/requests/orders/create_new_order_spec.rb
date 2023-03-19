require 'rails_helper'

RSpec.describe 'Orders::CreateNewOrders', type: :request do
  describe 'POST /create' do
    let(:customer) { create(:customer) }
    let(:fabric) { create(:fabric) }
    let(:workroom) { create(:workroom) }
    let(:product) { create(:product) }
    let(:params) do
      {
        customer_id: customer.id,
        fabric_id: fabric.id,
        workroom_id: workroom.id,
        product_id: product.id,
        order: {
          notes: 'notes',
          comment: 'comment',
          idx: 1,
          payment: 1,
          payed: 1,
          trello_card_id: 'trello_card_id'
        }
      }
    end

    it 'returns http success' do
      post('/orders/create_new_order', params:)

      expect(response).to redirect_to(order_path(Order.last))
    end

    it 'creates new order' do
      expect { post('/orders/create_new_order', params:) }.to change(Order, :count).by(1)
    end
  end
end
