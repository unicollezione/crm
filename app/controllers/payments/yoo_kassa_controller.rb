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
          value: 4000,
          currency: 'RUB'
        },
        capture: true,
        description:,
        receipt: {
          customer: {
            full_name: 'Иванов Иван Иванович',
            email: 'email@test.com',
            phone: '+79000000000'
          },
          items: [
            {
              description: 'Брюки',
              quantity: '2.00',
              amount: {
                value: 1000,
                currency: 'RUB'
              },
              vat_code: 1,
              payment_mode: 'full_prepayment',
              payment_subject: 'commodity',
              country_of_origin_code: 'RU',
              customs_declaration_number: 'test'
            },
            {
              description: 'Куртка',
              quantity: '1.00',
              amount: {
                value: 2000,
                currency: 'RUB'
              },
              vat_code: 1,
              payment_mode: 'full_prepayment',
              payment_subject: 'commodity',
              country_of_origin_code: 'RU',
              customs_declaration_number: 'test'
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

    def description
      params[:description]
    end

    def value
      params[:amount]
    end

    def return_url
      'http://localhost:3000'
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
