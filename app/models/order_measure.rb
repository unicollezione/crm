# == Schema Information
#
# Table name: order_measures
#
#  id         :bigint           not null, primary key
#  order_id   :bigint           not null
#  measure_id :bigint           not null
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OrderMeasure < ApplicationRecord
  belongs_to :order
  belongs_to :measure
  validates_presence_of :order
  validates_presence_of :measure
end
