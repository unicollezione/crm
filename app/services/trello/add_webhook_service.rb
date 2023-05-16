module Trello
  # class Trello::AddWebhookService
  #
  # Service for adding webhook to Trello card
  class AddWebhookService
    def initialize(order)
      @order = order
      @card = Trello::Board.find(order.workroom.trello_list.board)
                           .cards
                           .find(order.trello_card_id)
                           .first
    end

    attr_reader :order, :card

    def call
      return unless card

      Trello::Webhook.create(model_id: card.id,
                             description: "Order ##{order.idx}",
                             callback_url: ENV.fetch('WEBHOOK_TRELLO_PATH'))
    end
  end
end
