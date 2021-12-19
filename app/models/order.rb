# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  idx          :integer
#  customer_id  :bigint           not null
#  purchased_at :datetime
#  product_id   :bigint           not null
#  fabric_id    :bigint           not null
#  comment      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  aasm_state   :string
#  workroom_id  :bigint           not null
#  trello_url   :string
#  prepared_at  :datetime
#  prepayment   :integer          default(0)
#  payment      :integer          default(0)
#  ready_at     :date
#  payed        :boolean
#
# Order
# Order represent customers order
class Order < ApplicationRecord
  include Qrcodable

  belongs_to :customer
  belongs_to :product
  belongs_to :fabric
  belongs_to :workroom
  has_many :order_measures
  has_many :measures, through: :order_measures

  include AASM

  has_one_attached :illustration
  has_one_attached :qr_code
  has_one_attached :trello_qr_code
  has_one_attached :chat_qr_code

  accepts_nested_attributes_for :order_measures
  after_create :attach_qr_code

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

  def name
    idx
  end
end
