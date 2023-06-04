# frozen_string_literal: true

module Webhooks
  # class Webhooks::TrelloController
  class TrelloController < ApplicationController
    skip_before_action :authenticate_user!, :verify_authenticity_token

    # Creates events for the order and updates order aasm_state to the current Trello card column aka list_after
    def create
      service = Trello::OrderWebhookService.new(params:)

      service.call

      render json: { status: service.status }
    end

    def index
      order
          &.order_events
          &.create(event_source: :notification, body: created_payload)

      render json: { status: 'ok' }
    end

    private

    def order
      @order ||= Order.find_by(trello_card_id: params[:path])
    end

    def created_payload
      {
        action_type:,
        card_name: order.idx,
        creator: :notification,
        list_before: :none,
        list_after:
      }
    end
  end
end
