# frozen_string_literal: true

FactoryBot.define do
  factory :taylor do
    name { Faker::Name.name }
    meta { Faker::Lorem.word }
  end
end
