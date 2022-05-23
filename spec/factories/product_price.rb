FactoryBot.define do
  factory :product_price do
    value{Faker::Number.number(digits: 4)}
    tag{Faker::Lorem.word}
    association :product
  end
end
