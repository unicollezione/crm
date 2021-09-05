# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :illustratinos
  has_many :product_measurements
  has_many :measures, through: :product_measurements
end
