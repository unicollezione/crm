# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  idx        :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Product
class Product < ApplicationRecord
  has_one_attached :illustration
  has_many :product_measurements
  has_many :measures, through: :product_measurements
  has_many :instructions
end
