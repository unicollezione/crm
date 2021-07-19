# frozen_string_literal: true

FactoryBot.define do
  factory :product_price do
    value { Faker::Number.number(digits: 4) }
    tag { Faker::Lorem.word }
    product_id { Product.ids.sample }
  end
end
