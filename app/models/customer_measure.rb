# frozen_string_literal: true

class CustomerMeasure < ApplicationRecord
  belongs_to :measure
  belongs_to :customer
end
