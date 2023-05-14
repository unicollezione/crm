# frozen_string_literal: true

# class CustomersController
#
# CRUD for customers
class CustomersController < ApplicationController
  before_action :customers, only: %i[index create]
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    return unless @customer.save

    render partial: 'orders/customers', locals: { customers: @customers, customer: @customer }
  end

  def index; end

  private

  def customer_params
    params.require(:customer).permit(:nickname)
  end

  def customers
    @customers ||= Customer.all
  end
end
