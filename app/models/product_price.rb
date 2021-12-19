# frozen_string_literal: true

# == Schema Information
#
# Table name: product_prices
#
#  id         :bigint           not null, primary key
#  value      :integer
#  tag        :string
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductPrice < ApplicationRecord
  belongs_to :product
end
