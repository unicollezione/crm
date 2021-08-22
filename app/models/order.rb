# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :fabric
  belongs_to :workroom
end
