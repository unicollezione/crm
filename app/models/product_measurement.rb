# == Schema Information
#
# Table name: product_measurements
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  measure_id :bigint           not null
#  range      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductMeasurement < ApplicationRecord
  belongs_to :product
  belongs_to :measure
end
