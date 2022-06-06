# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trello::CreateOrderService do
  subject(:service) { described_class.new(order) }
  let(:order) { create :order, :with_trello_list }

  it 'works' do
    expect(service.call).to eq('')
  end
end
