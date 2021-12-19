# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  idx        :integer
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CustomerSerializer, type: :serializer do
  describe 'as_json' do
    it 'returns the current customer' do
      spec_customer = FactoryBot.build(:customer)
      serialized = JSON.parse(spec_customer.serializable_hash.to_json)
      expect(serialized).to match_response_schema('customer')
    end
  end
end
