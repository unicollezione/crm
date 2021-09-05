# frozen_string_literal: true

class Measure < ApplicationRecord
  has_many :product_measurements
  has_many :products
end
