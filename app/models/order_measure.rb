class OrderMeasure < ApplicationRecord
  belongs_to :order
  belongs_to :measure
end
