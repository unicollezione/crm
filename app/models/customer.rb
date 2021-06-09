# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :nickname, presence: true
end
