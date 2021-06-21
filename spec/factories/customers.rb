# frozen_string_literal: true

FactoryBot.define do
  factory :customers do
    sequence(:nickname) { |n| "factorycustomer#{n}" }
  end
end
