# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  has_one_attached :illustration
  has_many :product_measurements
  has_many :measures, through: :product_measurements
end
