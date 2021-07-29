FactoryBot.define do
  factory :customer_measure do
    measure
    customer
    value{Faker::Lorem.word}
  end
end
