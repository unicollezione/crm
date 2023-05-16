# frozen_string_literal: true

# class OrderEvent
#
# Entitiy for storing Trello webhooks updates for orders
class OrderEvent < ApplicationRecord
  belongs_to :order

  validates :order_id, :event_source, :body, presence: true
end
