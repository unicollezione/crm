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

RSpec.describe Customer, type: :model do
  before(:all) do
    @customer1 = create(:customer)
  end

  it 'is valid with valid attributes' do
    expect(@customer1).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:customer, nickname: nil)).to_not be_valid
  end
end
