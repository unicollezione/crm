# frozen_string_literal: true
# CardsController
# Render cards
class CardsController < ApplicationController
<<<<<<< HEAD
  before_action :find_card , only: %i[show trello image file_path]
=======
  before_action :find_card , only: %i[show trello image]
>>>>>>> create path to save img

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

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> create path to save img
  def image
    pdf = MiniMagick::Image.open([ENV['TEMPORARY_ASSETS_PATH'], "#{@card.idx}"].join)
    pdf.format "jpg"
    pdf.write([path, "#{@card.idx}.jpg"].join)
<<<<<<< HEAD
    @card.illustration.attach(**trello_card_attributes)
=======
>>>>>>> create path to save img
  end

  private

  def find_card
    @card = Order
            .includes(product: %i[product_measurements measures])
            .find_by(id: params[:id])
  end

  def path
    path = "./tmp/#{self.class.to_s.downcase}/"
    Dir.mkdir(path) unless Dir.exist?(path)
    path
  end

  def path
    path = "./tmp/#{self.class.to_s.downcase}/"
    Dir.mkdir(path) unless Dir.exist?(path)
    path
  end

  def file_path
    [path, "#{@card.idx}.jpg"].join
  end

  def trello_card_attributes
    {
      io: File.open(file_path), 
      filename: "#{@card.idx}.jpg", 
      contnt_type: 'image/jpg'
    }
  end

end
