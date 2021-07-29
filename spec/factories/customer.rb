# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    sequence(:nickname) { |n| "factorycustomer#{n}" }
    after (:create) do |customer|
      customer.orders << build(:order)
      customer.products << build(:product)
    end
  end
end
