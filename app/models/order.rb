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
  include OrdersHelper
  include Qrcodable

  belongs_to :customer
  belongs_to :fabric
  belongs_to :product
  belongs_to :workroom

  has_one :trello_list, through: :workroom

  has_many :order_measures, dependent: :destroy
  has_many :measures, through: :order_measures
  has_many :product_measures, through: :product
  has_many :order_events, dependent: :destroy

  has_one_attached :chat_qr_code
  has_one_attached :illustration
  has_one_attached :qr_code
  has_one_attached :trello_pdf
  has_one_attached :trello_qr_code

  accepts_nested_attributes_for :order_measures, :customer, :fabric

  after_create :attach_qr_code
  after_create :create_order_with_trello_list

  validates :customer_id, :idx, :product_id, :fabric_id, :workroom_id, presence: true
  validates :idx, uniqueness: true

  scope :unpaid, -> { Order.where(payed: false) }

  delegate :name, to: :idx

  def illustration_url
    product.illustration.attached? &&
      Rails.application.routes.url_helpers.rails_blob_url(product.illustration)
  end

  def trello_card_pdf
    Rails.application.routes.url_helpers.url_for(trello_pdf) if trello_pdf.attached?
  end

  def trello_card
    @trello_card ||= trello_card_id && Trello::Card.find(trello_card_id)
  rescue Trello::Error
    nil
  end

  private

  def create_order_with_trello_list
    workroom.trello_list &&
      Trello::CreateOrderService.new(self).call
  end
end
