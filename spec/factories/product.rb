FactoryBot.define do
  factory :product do
    idx { 1 }
    name { Faker::Name.name }
  end
end
