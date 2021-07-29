FactoryBot.define do
  factory :product do
    name{Faker::Name.name}
    customer
  end
end
