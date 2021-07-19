# frozen_string_literal: true

FactoryBot.define do
  factory :fabric do
    title { Faker::FunnyName.name }
  end
end
