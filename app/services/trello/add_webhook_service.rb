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
                             callback_url:)
    rescue Trello::Error
      nil
    end

    private

    def callback_url
      URI::HTTP.build(
        host: ENV.fetch('HOST'),
        path: ENV.fetch('WEBHOOK_TRELLO_PATH'),
        query: { id: order.trello_card_id }.to_query
      ).to_s
    end
  end
end
