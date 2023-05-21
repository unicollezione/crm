# frozen_string_literal: true

module Payments
  # class Payments::YooKassaController
  class YooKassaController < ApplicationController
    def create
      payment_intent = Yookassa.payments.create(payment:)

      @confirmation_url = payment_intent.confirmation.confirmation_url
    end

    def index; end

    private

    def payment # rubocop:disable Metrics/MethodLength
      {
        amount: {
          value:,
          currency: 'RUB'
        },
        capture: true,
        description: "Заказ № #{order}",
        receipt: {
          customer: {
            full_name:,
            email:,
            phone:
          },
          items: [
            {
              description:,
              quantity: '1.00',
              amount: {
                value:,
                currency: 'RUB'
              },
              vat_code: 1,
              payment_mode: 'full_prepayment',
              payment_subject: 'service',
              country_of_origin_code: 'RU'
            }
          ]
        },
        expires_at:,
        confirmation: {
          type: 'redirect',
          return_url:
        }
      }
    end

    def full_name
      params[:full_name]
    end

    def product
      params[:product]
    end

    def fabric
      params[:fabric]
    end

    def order
      params[:order]
    end

    def email
      params[:email]
    end

    def phone
      params[:phone]
    end

    def description
      ['Изготовление на заказ:', product, fabric].join(' ')
    end

    def value
      params[:amount]
    end

    def return_url
      'https://unicollezione.com'
    end

    def expires_at
      if params[:expires_at].present?
        Time.parse(params[:expires_at])
      else
        Time.now + 1.hour
      end
    end
  end
end
