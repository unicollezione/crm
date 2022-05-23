FactoryBot.define do
  factory :city do
    association :country
    name {Faker::Address.city}
  end
end
