# frozen_string_literal: true

# == Schema Information
#
# Table name: customer_measures
#
#  id          :bigint           not null, primary key
#  measure_id  :bigint           not null
#  customer_id :bigint           not null
#  value       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CustomerMeasure < ApplicationRecord
  belongs_to :measure
  belongs_to :customer
end
