FactoryBot.define do
  factory :contact do
    association :customer
    association :contact_type
    value{'number'}
  end
end
