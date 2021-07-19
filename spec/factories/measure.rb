# frozen_string_literal: true

FactoryBot.define do
  factory :measure do
    tag { Faker::Lorem.word }
  end
end
