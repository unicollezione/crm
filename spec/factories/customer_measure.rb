FactoryBot.define do
  factory :customer_measure do
    association :measure
    association :customer
    value{'params'}
  end
end
