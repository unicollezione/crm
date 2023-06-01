# frozen_string_literal: true

# class ContactController
class ContactsController < ApplicationController
  before_action :customer, only: %i[create]

  def new
    @customer = Customer.find_by(id: params[:customer_id])
    @contact = Contact.new(customer: @customer)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = @customer.contacts.build(permitted_params)

    return unless @contact.save

    redirect_to customer_path(@customer)
  end

  private

  def customer
    @customer ||= Customer.find_by(id: permitted_params[:customer_id])
  end

  def permitted_params
    params.require(:contact).permit(:customer_id, :value, :contact_type_id)
  end
end
