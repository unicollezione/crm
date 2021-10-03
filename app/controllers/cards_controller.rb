class CardsController < ApplicationController
  def show
    @card = Order.includes(:product).find_by(idx: params[:id])

    render pdf: 'card.title',
           encoding: 'utf8',
           page_size: 'A6'
  end

end
