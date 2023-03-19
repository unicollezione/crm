class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customers = Customer.all

    render partial: 'orders/customers', locals: { customers: @customers, customer: @customer } if @customer.save
  end

  def index
    @customers = Customer.all
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname)
  end
end
