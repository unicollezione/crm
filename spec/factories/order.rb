# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    idx { Faker::IDNumber.valid }
    index_orders_on_customer_id { Customer.ids.sample }
    purchased_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    index_orders_on_product_id { Product.ids.sample }
    index_orders_on_fabric_id { Fabric.ids.sample }
    comment { Faker::Lorem.sentence(word_count: 3) }
    aasm_state { [true, false].sample }
    association :customer
  end
end
