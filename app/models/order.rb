class Order < ApplicationRecord
  include AASM

  aasm do
  end
  belongs_to :client
  belongs_to :product
  belongs_to :fabric
end
