# frozen_string_literal: true

# OrdersController
# This controller is responsible for handling the
# CRUD operations for the order entity.
class OrdersController < ApplicationController
  before_action :fabrics, :workrooms, :customers, :products, only: %i[new]

  def index
  end

  def new
    @order = Order.new
  end

  def create
    redirect_to new_order_path
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
