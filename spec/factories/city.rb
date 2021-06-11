FactoryBot.define do
  factory :city do
    country_id {Country.ids.sample}
    name {Faker::Address.city}
  end
end
