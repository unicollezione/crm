# frozen_string_literal: true

# == Schema Information
#
# Table name: measures
#
#  id         :bigint           not null, primary key
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  range      :string
#
class Measure < ApplicationRecord
  has_many :product_measurements
  has_many :products

  def name
    tag
  end
end
