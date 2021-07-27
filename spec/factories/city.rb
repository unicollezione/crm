FactoryBot.define do
  factory :city do
    country
    name {Faker::Address.city}
  end
end
