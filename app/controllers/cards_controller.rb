# frozen_string_literal: true

# CardsController
# Render cards
class CardsController < ApplicationController
  layout false, only: [:image]

  before_action :card, only: %i[show trello image file_path]

  def index
    @cards = Order.where(prepared_at: nil).last(12)
  end

  def show
    render  pdf: @card.idx.to_s,
            margin: { top: 1, bottom: 1, left: 1, right: 1 },
            viewport_size: '1920x1080',
            encoding: 'utf8',
            page_size: 'A4',
            layout: 'pdf'
  end

  def trello
    render  pdf: @card.idx.to_s,
            margin: { top: 1, bottom: 1, left: 1, right: 1 },
            encoding: 'utf8',
            page_size: 'A4',
            layout: 'pdf',
            template: 'cards/trello'
  end

  def wicked_pdf
    render  pdf: @card.idx.to_s,
            margin: { top: 1, bottom: 1, left: 1, right: 1 },
            encoding: 'utf8',
            page_size: 'A4',
            layout: 'pdf',
            template: 'cards/wicked_pdf'
  end

  def image
    Trello::CreateOrderService.new(@card).generate_jpg unless @card.illustration.attached?
  end

  private

  def card
    @card ||= Order
              .includes(product: %i[product_measurements measures])
              .find_by(idx: params[:id])
  end
end
