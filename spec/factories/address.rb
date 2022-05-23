FactoryBot.define do
  factory :address do
    association :customer
    association :country
    association :city
    street{Faker::Address.street_name}
    tag{Faker::Lorem.word}
  end
end
