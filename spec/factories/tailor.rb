FactoryBot.define do
  factory :tailor do
    name{Faker::Name.name}
    meta{Faker::Lorem.world}
  end
end
