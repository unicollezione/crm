# frozen_string_literal: true

# OrdersController
# This controller is responsible for handling the
# CRUD operations for the order entity.
class OrdersController < ApplicationController
  before_action :fabrics, only: %i[new]

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

  def fabrics
    @fabrics ||= Fabric.all
  end
end
