# frozen_string_literal: true

# class ItemsController
class ItemsController < ApplicationController
  def index; end

  def show
    @item = Product.find(params[:id])
  end
end
