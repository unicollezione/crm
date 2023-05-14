# frozen_string_literal: true

# OrdersController
# This controller is responsible for handling the
# CRUD operations for the order entity.
class OrdersController < ApplicationController
  include OrdersHelper

  before_action :fabrics, :workrooms, :customers, :products, only: %i[new]

  def index
    @orders = Order.last(12)
  end

  def new
    @idx = next_order_idx
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def update; end

  private

  def customers
    @customers ||= Customer.all
  end

  def fabrics
    @fabrics ||= Fabric.all
  end

  def workrooms
    @workrooms ||= Workroom.all
  end

  def products
    @products ||= Product.all
  end
end
