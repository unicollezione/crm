class ProductMeasurement < ApplicationRecord
  belongs_to :product
  belongs_to :measure
end
