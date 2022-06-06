# frozen_string_literal: true

module Api
  class ItemsController < Api::V1::BaseController
    def index
      @items = Product.all
      render json: @items
    end

    def show
      @item = current_user.orders.find_by(idx: params[:id])

      render json: @item
    end
  end
end
