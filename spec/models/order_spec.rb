# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:customer_id) }

    context 'when idx is not unique' do
      let(:order) { create(:order) }
      let(:order2) { build(:order, idx: order.idx) }

      it 'is not valid' do
        expect(order2).not_to be_valid
      end
    end
  end
end

