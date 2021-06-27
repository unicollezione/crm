# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
end

module Api
  module V1
    class CustomersController < ApplicationController
      before_action :set_customer, only: %i[show update destroy]

      def index
        @customers = Customer.all
        render_json @customers
      end

      def show
        @customer
        respond_to do |format|
          format.pdf do 
        pdf = Prawn::Document.new
        pdf.text "Hello World"
        send_data pdf.render
        end
        end
      end

      def create
        @customer = Customer.new(customer_params)
        if @customer.save
          render json: { success: true, nickname: @customer.nickname }, status: 201
        else
          render json: { error: @customer.errors }, status: 422
        end
      end

      def update
        if @customer
          @customer.update(customer_params)
          render json: { message: 'Customer successfully updated.' }
        else
          render json: { error: 'Unable to update Customer.' }
        end
      end

      def destroy
        if @customer
          @customer.destroy
          render json: { message: 'Customer successfully deleted.' }
        elsif customer.blank?
          render json: { errors: 'Customer not found.' }, status: 404
        else
          render json: { error: 'Unable to delete Customer.' }, status: 404
        end
      end

      private

      def customer_params
        params.permit(:nickname)
      end

      def set_customer
        @customer = Customer.find(params[:id])
      end

      def render_json(customer)
        render json: CustomerSerializer.new(customer).serializable_hash.to_json
      end
    end
  end
end
