FactoryBot.define do
  factory :address do
    customer_id{Customer.ids.sample}
    country_id{Country.ids.sample}
    city_id{City.ids.sample}
    street{Faker::Address.street_name}
    tag{Faker::Lorem.word}
  end
end
