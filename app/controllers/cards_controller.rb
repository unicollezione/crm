# frozen_string_literal: true
# CardsController
# Render cards
class CardsController < ApplicationController
  before_action :find_card , only: %i[show trello image]

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
            layout: 'pdf'
  end

  def image
    pdf = MiniMagick::Image.open([ENV['TEMPORARY_ASSETS_PATH'], "#{@card.idx}"].join)
    pdf.format "jpg"
    pdf.write([path, "#{@card.idx}.jpg"].join)
    @card.illustration.attach(io: File.open(file_path), filename: "#{@card.idx}.jpg", content_type: 'image/ipg')
  end

  private

  def find_card
    @card = Order
            .includes(product: %i[product_measurements measures])
            .find_by(idx: params[:id])
  end

  def path
    path = "./tmp/#{self.class.to_s.downcase}/"
    Dir.mkdir(path) unless Dir.exist?(path)
    path
  end

  def file_path
    [path, "#{@card.idx}.jpg"].join
  end
end
