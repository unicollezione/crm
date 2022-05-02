# frozen_string_literal: true

# CardsController
# Render cards
class CardsController < ApplicationController
  def index
    @cards = Order.where(prepared_at: nil).last(12)
  end

  def show
    @card = Order
            .includes(product: %i[product_measurements measures])
            .find_by(idx: params[:id])

    render  pdf: @card.idx.to_s,
            margin: { top: 1, bottom: 1, left: 1, right: 1 },
            viewport_size: '1920x1080',
            encoding: 'utf8',
            page_size: 'A4',
            layout: 'pdf'
  end

  def trello
    @card = Order
            .includes(product: %i[product_measurements measures])
            .find_by(idx: params[:id])

    render  pdf: @card.idx.to_s,
            margin: { top: 1, bottom: 1, left: 1, right: 1 },
            encoding: 'utf8',
            page_size: 'A4',
            layout: 'pdf'
  end

  def create_image
    @card = Order
            .includes(product: %i[product_measurements measures])
            .find_by(idx: params[:id])
    image = MiniMagick::Image.open("/home/kurt/Downloads/#{@card.idx}") # тут изменить путь до файла pdf
    image.format"jpg"
    image.write "card_#{@card.idx}.jpg"
  end
end
