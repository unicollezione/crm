# frozen_string_literal: true

FactoryBot.define do
  factory :contact_type do
    name { Faker::Name.name }
  end
end
