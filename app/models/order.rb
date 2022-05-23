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
  has_many :product_measures, through: :product
  belongs_to :fabric
  belongs_to :workroom
  has_one :trello_list, through: :workroom
  has_many :order_measures
  has_many :measures, through: :order_measures
  has_one :trello_card
  include AASM

  has_one_attached :illustration
  has_one_attached :qr_code
  has_one_attached :trello_pdf
  has_one_attached :trello_qr_code
  has_one_attached :chat_qr_code

  accepts_nested_attributes_for :order_measures
  after_create :setup_order
  before_update :update_measures
  after_create :create_order_with_trello_list

  validates_presence_of :customer, :idx, :product

  scope :unpaid, -> { Order.where(payed: false) }
  scope :waiting_for_measures, -> { includes(:measures).where(measures: { id: nil }) }

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

  def illustration_url
    product.illustration.attached? &&
      Rails.application.routes.url_helpers.rails_blob_url(product.illustration)
  end

  def trello_card_pdf
    trello_pdf.blob.service_url if trello_pdf.attached?
  end

  private

  def setup_order
    ActiveRecord::Base.connection.transaction do
      attach_qr_code
      attach_product_measures
      update_measures

      save
    end
  end

  def attach_product_measures
    product &&
      product.product_measurements.pluck(:measure_id).each do |measure_id|
        order_measures.build(
          value: 0,
          measure_id: measure_id
        )
      end
  end

  def update_measures
    measures = Measure.all

    notes &&
      notes.upcase.gsub(/\n/, ';').gsub(/\s+/, '').split(';').each do |arg|
        note = arg.split(/:|-/)
        measure = measures.detect { |m| m.tag.eql? note[0] }
        measure &&
          order_measures.build(
            value: note[1].to_s,
            measure_id: measure.id
          )
      end

    self.notes = ''
  end

  def create_order_with_trello_list
    Trello::CreateOrderService.new(self).call
  end
end
