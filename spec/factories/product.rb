FactoryBot.define do
  factory :product do
    idx {Faker::IDNumber.valid}
    name{Faker::Name.name}
    customer_id{Customer.ids.sample}
    association :customer
  end
end
