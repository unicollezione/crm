module Trello
  # class Trello::AddWebhookService
  #
  # Service for adding webhook to Trello card
  class AddWebhookService
    def initialize(order)
      @order = order
      @card = Trello::Board.find(order.workroom.trello_list.board)
                           .cards
                           .find { |e| e.id.eql?(order.trello_card_id) }
    end

    attr_reader :order, :card

    def call
      return unless card

      Trello::Webhook.create(model_id: card.id,
                             description: "Order ##{order.idx}",
                             callback_url:)
    end

    private

    def callback_url
      URI::HTTP.build(
        host: ENV.fetch('HOST'),
        path: [ENV.fetch('WEBHOOK_TRELLO_PATH'), card.id].join('/')
      ).to_s
    end
  end
end
