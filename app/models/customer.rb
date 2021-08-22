# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :nickname, presence: true
  has_many :orders
  has_many :products

  def name
    nickname
  end
end
