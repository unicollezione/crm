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

    redirect_to customer_path(@customer) if @customer.save
  end

  def index
    if params[:search].present?
      @customers = Customer.where('nickname LIKE ?', "%#{params[:search]}%")
    else
      @customers = Customer.last(10)
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname)
  end

  def customers
    @customers ||= Customer.all
  end
end
