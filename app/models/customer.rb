# frozen_string_literal: true

class Customer < ApplicationRecord
<<<<<<< HEAD
  validates :nickname, presence: true
=======
  has_many :orders
  has_many :products
>>>>>>> do customer with products
end
