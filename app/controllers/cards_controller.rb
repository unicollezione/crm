class CardsController < ApplicationController
  def index
    @cards = Order.where(prepared_at: nil)
  end

  def show
    @card = Order
            .includes(product: %i[product_measurements measures])
            .find_by(idx: params[:id])

    render  pdf: 'card.title',
            margin: { top: 1, bottom: 1, left: 1, right: 1 },
            viewport_size: '1920x1080',
            encoding: 'utf8',
            page_size: 'A6'
  end
end
