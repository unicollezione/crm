class Api::ItemsController < Api::V1::BaseController
  def index
    @items = Product.all
    render json: @items
  end
end
