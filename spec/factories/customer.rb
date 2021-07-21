FactoryBot.define do
  factory :customer do
    sequence(:nickname) { |n| "factorycustomer#{n}" }
  end
end
