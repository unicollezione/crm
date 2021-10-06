# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :fabric
  belongs_to :workroom
  has_many :order_measures
  has_many :measures, through: :order_measures

  include AASM

  has_one_attached :illustration
  accepts_nested_attributes_for :order_measures

  aasm do
    state :купить, initial: true
    state :на_производстве
    state :в_офисе

    event :buy do
      transitions to: :in_office, from: :to_buy
    end

    event :bring_to_dev do
      transitions to: :in_deveopment, from: :in_office
    end
  end
end
