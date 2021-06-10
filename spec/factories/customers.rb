# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    sequence(:nickname) { |n| "factorycustomer#{n}" }
  end
end
