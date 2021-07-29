# frozen_string_literal: true

class Order < ApplicationRecord
  #include AASM

  #aasm do
  #end
  belongs_to :customer
  belongs_to :product
  belongs_to :fabric
  belongs_to :workroom
end
